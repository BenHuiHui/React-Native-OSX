//
//  RCMLog.h
//  ReactNativeMacLib
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * An enum representing the severity of the log message.
 */
typedef NS_ENUM(NSInteger, RCMLogLevel) {
    RCMLogLevelInfo = 1,
    RCMLogLevelWarning = 2,
    RCMLogLevelError = 3,
    RCMLogLevelMustFix = 4
};

@interface RCMLog : NSObject

@end
