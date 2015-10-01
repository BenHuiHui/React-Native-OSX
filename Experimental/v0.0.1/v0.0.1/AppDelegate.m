//
//  AppDelegate.m
//  v0.0.1
//
//  Created by Hui Hui on 29/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "AppDelegate.h"
#import "RCTRootView.h"

/**
 *  Minimized version of react native 
 *  Webpack is used as javascript bundler as it is modularized and can be easily used
 *  Refer the previous tutorial for more information on react-packager and webpack.
 *  In this version, we will make the code work: load jsbundle from server and execute
 *  In the following versions, we will optimized and add in more ingredient :)
 *
 *
 *  Main target: 
 *  1) How javascript is executed
 *  2) How react native export function/method
 *  3) How views are layout
 */


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSURL *jsLocation;
    
    jsLocation = [NSURL URLWithString:@"http://localhost:8080/bundle.js"];
    
    RCTRootView *rootView = [[RCTRootView alloc]initWithBundleURL:jsLocation moduleName:@"0_0_1" initialProperties:nil launchOptions:nil];
    
    rootView.frame = self.window.contentView.bounds;
    [self.window.contentView addSubview:rootView];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
