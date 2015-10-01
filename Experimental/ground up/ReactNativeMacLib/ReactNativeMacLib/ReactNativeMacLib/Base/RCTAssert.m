//
//  RCTAssert.m
//  ReactNativeMacLib
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "RCTAssert.h"

NSException *_RCTNotImplementedException(SEL, Class);
NSException *_RCTNotImplementedException(SEL cmd, Class cls)
{
    NSString *msg = [NSString stringWithFormat:@"%s is not implemented "
                     "for the class %@", sel_getName(cmd), cls];
    return [NSException exceptionWithName:@"RCTNotDesignatedInitializerException"
                                   reason:msg userInfo:nil];
}

@implementation RCTAssert

@end
