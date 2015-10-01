//
//  RCMJavascriptLoader.h
//  ReactNativeMacLib
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RCMBridgeDelegate.h"

/**
 *  Load javascript bundle file from the server or local document directory, i.e, bundle.js is generated and put at the local repository
 */
@interface RCMJavascriptLoader : NSObject

+ (void)loadBundleAtURL:(NSURL *)moduleURL onComplete:(RCMSourceLoadBlock)onComplete;

@end
