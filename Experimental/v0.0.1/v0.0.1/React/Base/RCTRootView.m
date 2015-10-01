//
//  RCTRootView.m
//  v0.0.1
//
//  Created by Hui Hui on 29/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "RCTRootView.h"
#import "RCTJavascriptLoader.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ModuleDemo.h"

@implementation RCTRootView

- (instancetype) initWithBundleURL:(NSURL *)bundleURL moduleName:(NSString *)moduleName initialProperties:(NSDictionary *)initialProperties launchOptions:(NSDictionary *)launchOptions{
    
    if (self = [super initWithFrame:CGRectZero]) {
        
        //Set color
        self.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
        
        //Load the javascript bundle
        [RCTJavascriptLoader loadBundleAtURL:bundleURL onComplete:^(NSError *error, NSString *source) {
           
            //NSLog(@"Loaded data is %@", source);
           
            //Run the javascript
            JSContext *context = [[JSContext alloc] initWithVirtualMachine:[[JSVirtualMachine alloc] init]];
            
            [context setExceptionHandler:^(JSContext *context, JSValue *value) {
                NSLog(@"%@", value);
            }];
            
            //Export the module
            context[@"SayHi"] = [ModuleDemo class];
            
            [context evaluateScript:source];
            
            
            
        }];
    }
    
    return self;
}


@end
