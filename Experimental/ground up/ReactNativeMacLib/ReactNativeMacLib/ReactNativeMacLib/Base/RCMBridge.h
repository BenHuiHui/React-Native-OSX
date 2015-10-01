//
//  RCMBridge.h
//  ReactNativeMacLib
//
//  Created by Hui Hui on 25/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RCMBridgeDelegate.h"


@class RCMBridge;

@interface RCMBridge : NSObject

- (instancetype)initWithDelegate:(id<RCMBridgeDelegate>)delegate
                   launchOptions:(NSDictionary *)launchOptions NS_DESIGNATED_INITIALIZER;


@end
