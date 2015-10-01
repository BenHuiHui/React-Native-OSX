//
//  RCTJavascriptLoader.h
//  v0.0.1
//
//  Created by Hui Hui on 29/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RCTSourceLoadBlock)(NSError *error, NSString *source);

@interface RCTJavascriptLoader : NSObject

+ (void)loadBundleAtURL:(NSURL *)moduleURL onComplete:(RCTSourceLoadBlock)onComplete;

@end
