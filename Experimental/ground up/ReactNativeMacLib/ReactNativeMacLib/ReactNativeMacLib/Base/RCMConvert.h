//
//  RCMConvert.h
//  ReactNativeMacLib
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCMConvert : NSObject

+ (NSArray *)NSArray:(id)json;
+ (NSDictionary *)NSDictionary:(id)json;
+ (NSString *)NSString:(id)json;
+ (NSNumber *)NSNumber:(id)json;


+ (NSURL *)NSURL:(id)json;


@end
