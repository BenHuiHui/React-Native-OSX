//
//  RCMRootView.h
//  ReactNativeMacLib
//
//  Created by Hui Hui on 25/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class RCMBridge;

@interface RCMRootView : NSView

- (instancetype)initWithBridge:(RCMBridge *)bridge
                    moduleName:(NSString *)moduleName
             initialProperties:(NSDictionary *)initialProperties NS_DESIGNATED_INITIALIZER;


- (instancetype)initWithBundleURL:(NSURL *)bundleURL
                       moduleName:(NSString *)moduleName
                initialProperties:(NSDictionary *)initialProperties
                    launchOptions:(NSDictionary *)launchOptions;

@end
