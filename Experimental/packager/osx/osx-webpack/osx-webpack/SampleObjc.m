//
//  SampleObjc.m
//  osx-webpack
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "SampleObjc.h"

@implementation SampleObjc

+ (void)sayHi{
    NSLog(@"Hi");
}

+ (void)addYellowSubView:(NSView *)view{
    NSView *aView = [[NSView alloc]initWithFrame:view.bounds];
    aView.layer.backgroundColor = [NSColor yellowColor].CGColor;
    [view addSubview:aView];
    
    NSTextField *textField = [[NSTextField alloc]initWithFrame:view.bounds];
    [textField setStringValue:@"HelloFromRCM!"];
    [view addSubview:textField];
}

@end
