//
//  SampleObjc.h
//  osx-webpack
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol RCMExport <JSExport>

+ (void)sayHi;
+ (void)addYellowSubView: (NSView *)view;

@end

@interface SampleObjc : NSObject <RCMExport>

+ (void)sayHi;
+ (void)addYellowSubView: (NSView *)view;

@end
