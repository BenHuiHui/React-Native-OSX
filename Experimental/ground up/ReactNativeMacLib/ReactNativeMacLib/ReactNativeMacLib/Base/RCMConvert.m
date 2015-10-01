//
//  RCMConvert.m
//  ReactNativeMacLib
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "RCMConvert.h"
#import "RCMLog.h"
#import "RCMDefines.h"

@implementation RCMConvert

/**
 * This macro is used for creating converter functions for directly
 * representable json values that require no conversion.
 */
/*
#if RCM_DEBUG
#define RCM_JSON_CONVERTER(type)           \
+ (type *)type:(id)json                    \
{                                          \
if ([json isKindOfClass:[type class]]) { \
return json;                           \
} else if (json) {                       \
RCMLogConvertError(json, @#type);      \
}                                        \
return nil;                              \
}
#else
#define RCM_JSON_CONVERTER(type)           \
+ (type *)type:(id)json { return json; }
#endif

RCM_JSON_CONVERTER(NSArray)
RCM_JSON_CONVERTER(NSDictionary)
RCM_JSON_CONVERTER(NSString)
RCM_JSON_CONVERTER(NSNumber)



+ (NSURL *)NSURL:(id)json
{
    NSString *path = [self NSString:json];
    if (!path) {
        return nil;
    }
    
    @try { // NSURL has a history of crashing with bad input, so let's be safe
        
        NSURL *URL = [NSURL URLWithString:path];
        if (URL.scheme) { // Was a well-formed absolute URL
            return URL;
        }
        
        // Check if it has a scheme
        if ([path rangeOfString:@":"].location != NSNotFound) {
            path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            URL = [NSURL URLWithString:path];
            if (URL) {
                return URL;
            }
        }
        
        // Assume that it's a local path
        path = path.stringByRemovingPercentEncoding;
        if ([path hasPrefix:@"~"]) {
            // Path is inside user directory
            path = path.stringByExpandingTildeInPath;
        } else if (!path.absolutePath) {
            // Assume it's a resource path
            path = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:path];
        }
        return [NSURL fileURLWithPath:path];
    }
    @catch (__unused NSException *e) {
        RCMLogConvertError(json, @"a valid URL");
        return nil;
    }
}
*/

@end

/**
 * This macro is used for logging conversion errors. This is just used to
 * avoid repeating the same boilerplate for every error message.
 */
#define RCMLogConvertError(json, typeName) \
RCMLogError(@"JSON value '%@' of type %@ cannot be converted to %@", \
json, [json classForCoder], typeName)




