//
//  RCTJavascriptLoader.m
//  v0.0.1
//
//  Created by Hui Hui on 29/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "RCTJavascriptLoader.h"

// #import "RCTBridge.h"
// #import "RCTConvert.h"
// #import "RCTSourceCode.h"
// #import "RCTUtils.h"

#import <objc/message.h>

@implementation RCTJavascriptLoader

// RCT_NOT_IMPLEMENTED(- (instancetype)init)


+ (void)loadBundleAtURL:(NSURL *)scriptURL onComplete:(RCTSourceLoadBlock)onComplete
{
    // Sanitize the script URL
    //scriptURL = [RCTConvert NSURL:scriptURL.absoluteString];
    
    if (!scriptURL || (scriptURL.fileURL && ![[NSFileManager defaultManager] fileExistsAtPath:scriptURL.path])) {
        NSError *error = [NSError errorWithDomain:@"JavaScriptLoader" code:1 userInfo:@{
                            NSLocalizedDescriptionKey: scriptURL ? [NSString stringWithFormat:@"Script at '%@' could not be found.", scriptURL] : @"No script URL provided"}];

        onComplete(error, nil);
        return;
    }
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:scriptURL completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
        // Handle general request errors
        if (error) {
            
            if ([error.domain isEqualToString:NSURLErrorDomain]) {
                
                NSString *desc = [@"Could not connect to development server. Ensure node server is running and available on the same network - run 'npm start' from react-native root\n\nURL: " stringByAppendingString:scriptURL.absoluteString];
                
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey: desc,
                                           NSLocalizedFailureReasonErrorKey: error.localizedDescription, NSUnderlyingErrorKey: error,};
                error = [NSError errorWithDomain:@"JSServer" code:error.code userInfo:userInfo];
            }
            onComplete(error, nil);
            return;
        }
                                      
        // Parse response as text
        NSStringEncoding encoding = NSUTF8StringEncoding;
        if (response.textEncodingName != nil) {
            CFStringEncoding cfEncoding = CFStringConvertIANACharSetNameToEncoding((CFStringRef)response.textEncodingName);
            if (cfEncoding != kCFStringEncodingInvalidId) {
                encoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding);
            }
        }
        
        NSString *rawText = [[NSString alloc] initWithData:data encoding:encoding];
                                      
        // Handle HTTP errors
        if ([response isKindOfClass:[NSHTTPURLResponse class]] && ((NSHTTPURLResponse *)response).statusCode != 200) {
            
            NSDictionary *userInfo;
            NSDictionary *errorDetails = RCTJSONParse(rawText, nil);
            
            if ([errorDetails isKindOfClass:[NSDictionary class]] && [errorDetails[@"errors"] isKindOfClass:[NSArray class]]) {
                
                NSMutableArray *fakeStack = [NSMutableArray new];
                for (NSDictionary *err in errorDetails[@"errors"]) {
                    [fakeStack addObject: @{ @"methodName": err[@"description"] ?: @"",
                        @"file": err[@"filename"] ?: @"", @"lineNumber": err[@"lineNumber"] ?: @0}];
                }
                
                userInfo = @{ NSLocalizedDescriptionKey: errorDetails[@"message"] ?: @"No message provided", @"stack": fakeStack,};
            } else {
                userInfo = @{NSLocalizedDescriptionKey: rawText};
            }
            error = [NSError errorWithDomain:@"JSServer" code:((NSHTTPURLResponse *)response).statusCode userInfo:userInfo];
                                          
            onComplete(error, nil);
            return;
        }
                                      
        onComplete(nil, rawText);
    }];
    
    [task resume];
}


//TODO: Move RCTJSONParse back to RCTUtils

id RCTJSONParse(NSString *jsonString, NSError **error)
{
    return _RCTJSONParse(jsonString, NO, error);
}

static id _RCTJSONParse(NSString *jsonString, BOOL mutable, NSError **error)
{
    static SEL JSONKitSelector = NULL;
    static SEL JSONKitMutableSelector = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selector = NSSelectorFromString(@"objectFromJSONStringWithParseOptions:error:");
        if ([NSString instancesRespondToSelector:selector]) {
            JSONKitSelector = selector;
            JSONKitMutableSelector = NSSelectorFromString(@"mutableObjectFromJSONStringWithParseOptions:error:");
        }
    });
    
    if (jsonString) {
        
        // Use JSONKit if available and string is not a fragment
        if (JSONKitSelector) {
            NSInteger length = jsonString.length;
            for (NSInteger i = 0; i < length; i++) {
                unichar c = [jsonString characterAtIndex:i];
                if (strchr("{[", c)) {
                    static const int options = (1 << 2); // loose unicode
                    SEL selector = mutable ? JSONKitMutableSelector : JSONKitSelector;
                    return ((id (*)(id, SEL, int, NSError **))objc_msgSend)(jsonString, selector, options, error);
                }
                if (!strchr(" \r\n\t", c)) {
                    break;
                }
            }
        }
        
        // Use Foundation JSON method
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        if (!jsonData) {
            jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
            if (jsonData) {
                //RCTLogWarn(@"RCTJSONParse received the following string, which could "
                //           "not be losslessly converted to UTF8 data: '%@'", jsonString);
            } else {
                NSString *errorMessage = @"RCTJSONParse received invalid UTF8 data";
                if (error) {
                    //*error = RCTErrorWithMessage(errorMessage);
                } else {
                    //RCTLogError(@"%@", errorMessage);
                }
                return nil;
            }
        }
        NSJSONReadingOptions options = NSJSONReadingAllowFragments;
        if (mutable) {
            options |= NSJSONReadingMutableContainers;
        }
        return [NSJSONSerialization JSONObjectWithData:jsonData
                                               options:options
                                                 error:error];
    }
    return nil;
}

@end
