//
//  ModuleDemo.h
//  v0.0.1
//
//  Created by Hui Hui on 29/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ModuleDemoProtocol <JSExport>

+ (void)sayHi;

@end

@interface ModuleDemo : NSObject <ModuleDemoProtocol>

+ (void)sayHi;

@end
