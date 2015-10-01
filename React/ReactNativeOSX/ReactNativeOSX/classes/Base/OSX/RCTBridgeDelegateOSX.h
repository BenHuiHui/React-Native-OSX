//
//  RCTBridgeDelegateOSX.h
//  ReactNativeOSX
//
//  Created by Hui Hui on 27/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

typedef void (^RCTSourceLoadBlock)(NSError *error, NSString *source);

@class RCTBridgeOSX;

@protocol RCTBridgeDelegateOSX <NSObject>

- (NSURL *)sourceURLForBridge:(RCTBridgeOSX *)bridge;

@optional

- (NSArray *)extraModulesForBridge:(RCTBridgeOSX *)bridge;
- (void)loadSourceForBridge:(RCTBridgeOSX *)bridge withBlock:(RCTSourceLoadBlock)loadCallback;

@end
