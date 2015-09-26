//
//  AppDelegate.m
//  osx-webpack
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "AppDelegate.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "SampleObjc.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    JSContext *context = [[JSContext alloc] initWithVirtualMachine:[[JSVirtualMachine alloc] init]];

    /**
     * Demo 1
     * Sample code: Used to show how the javascript is executed using JavaScriptCore
     */
    /*
    [context evaluateScript:@"var aNumber = 10 + 20"];
    
    //output 30
    NSLog(@"Result is %d", [context[@"aNumber"] toInt32]);
    */
    
    /**
     * Demo 2
     * Load javascript from local js bundle file and execute
     */
    /*
    NSString *jsContent = [self contentOfJavaScriptFile:@"bundle"];
    [context evaluateScript:jsContent];
    
    //output 20
    NSLog(@"Result is %d", [[context[@"add"] callWithArguments:nil] toInt32]);
    */
    
    /**
     *  Demo 3
     *  Load js bundle file from local server (webpack)
     *  run 'webpack-dev-server' in packager folder
     */
    /*
    NSString *jsLocation = @"http://localhost:8080/bundle.js";
    [self contentFromUrl:jsLocation completionHandler:^(NSString *data) {
        //NSLog(@"Content is %@", data);
        
        [context setExceptionHandler:^(JSContext *context, JSValue *value) {
            NSLog(@"%@", value);
        }];
        [context evaluateScript:data];
        
        int val = [[context[@"add"] callWithArguments:nil] toInt32];
        NSLog(@"Result is %d", val);
        
        val = [[context[@"addTwoNums"] callWithArguments:@[@2,@3]] toInt32];
        NSLog(@"Result is %d", val);
        
        //Call objective-c methods
        context[@"SayHi"] = [SampleObjc class];
        [context[@"sayHiInObjc"] callWithArguments:nil];
        [context[@"addYellowSubView"] callWithArguments:@[self.window.contentView]];
    }];
    */
    
    /**
     *  Demo 4
     *  Load js bundle from local server (React Native Packager)
     */
    NSString *jsLocation = @"http://localhost:8081/index.ios.bundle";
    [self contentFromUrl:jsLocation completionHandler:^(NSString *data) {
        //NSLog(@"Content is %@", data);
        
        [context setExceptionHandler:^(JSContext *context, JSValue *value) {
            NSLog(@"%@", value);
        }];
        [context evaluateScript:data];
        
        int val = [[context[@"add"] callWithArguments:nil] toInt32];
        NSLog(@"Result is %d", val);
        
        val = [[context[@"addTwoNums"] callWithArguments:@[@2,@3]] toInt32];
        NSLog(@"Result is %d", val);
        
        //Call objective-c methods
        context[@"SayHi"] = [SampleObjc class];
        [context[@"sayHiInObjc"] callWithArguments:nil];
        [context[@"addYellowSubView"] callWithArguments:@[self.window.contentView]];
    }];

    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSString *)contentOfJavaScriptFile: (NSString *)filename{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"js"];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return content;
}

- (void)contentFromUrl: (NSString *)url completionHandler:(void (^)(NSString *data))handler{
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //NSLog(@"Error %@ \nData %@\nResponse %@",error,data,response);
        NSString *content = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        handler(content);
    }] resume];
}

@end
