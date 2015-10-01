//
//  ModuleDemo.m
//  v0.0.1
//
//  Created by Hui Hui on 29/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "ModuleDemo.h"

@implementation ModuleDemo

static int addTwoNumber(int, int );
static int addTwoNumber(int a, int b){
    return a+b;
}


+ (void)sayHi{
    addTwoNumber(1,2);
    NSLog(@"Hi from javascript");
}

@end
