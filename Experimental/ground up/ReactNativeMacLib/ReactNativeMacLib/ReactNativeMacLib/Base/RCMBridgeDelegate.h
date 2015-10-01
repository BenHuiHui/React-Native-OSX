//
//  RCMBridgeDelegate.h
//  ReactNativeMacLib
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

typedef void(^RCMSourceLoadBlock)(NSError *error, NSString *source);

@class RCMBridge;

@protocol RCMBridgeDelegate <NSObject>

- (NSURL *)sourceURLForBridge: (RCMBridge *)bridge;

@end