//
//  RCMLog.m
//  ReactNativeMacLib
//
//  Created by Hui Hui on 26/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import "RCMLog.h"
#import "RCMDefines.h"

@implementation RCMLog

@end

/**
 * Private logging function - ignore this.
 */
#define _RCMLog(lvl, ...) do { \
if (lvl >= RCMLOG_FATAL_LEVEL) { RCMAssert(NO, __VA_ARGS__); } \
_RCMLogFormat(lvl, __FILE__, __LINE__, __VA_ARGS__); } while (0)
RCM_EXTERN void _RCMLogFormat(RCMLogLevel, const char *, int, NSString *, ...) NS_FORMAT_FUNCTION(4,5);

/**
 * Logging macros. Use these to log information, warnings and errors in your
 * own code.
 */
#define RCMLog(...) _RCMLog(RCMLogLevelInfo, __VA_ARGS__)
#define RCMLogInfo(...) _RCMLog(RCMLogLevelInfo, __VA_ARGS__)
#define RCMLogWarn(...) _RCMLog(RCMLogLevelWarning, __VA_ARGS__)
#define RCMLogError(...) _RCMLog(RCMLogLevelError, __VA_ARGS__)
#define RCMLogMustFix(...) _RCMLog(RCMLogLevelMustFix, __VA_ARGS__)
