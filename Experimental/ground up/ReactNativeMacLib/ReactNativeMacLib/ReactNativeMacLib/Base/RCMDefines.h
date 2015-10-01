//
//  RCMDefines.h
//  ReactNativeMacLib
//
//  Created by Hui Hui on 25/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Make global functions usable in C++
 */
#if defined(__cplusplus)
#define RCM_EXTERN extern "C" __attribute__((visibility("default")))
#else
#define RCM_EXTERN extern __attribute__((visibility("default")))
#endif

/**
 * The RCM_DEBUG macro can be used to exclude error checking and logging code
 * from release builds to improve performance and reduce binary size.
 */
#ifndef RCM_DEBUG
#if DEBUG
#define RCM_DEBUG 1
#else
#define RCM_DEBUG 0
#endif
#endif

/**
 * The RCM_DEV macro can be used to enable or disable development tools
 * such as the debug executors, dev menu, red box, etc.
 */
#ifndef RCM_DEV
#if DEBUG
#define RCM_DEV 1
#else
#define RCM_DEV 0
#endif
#endif

#if RCM_DEV
#define RCM_IF_DEV(...) __VA_ARGS__
#else
#define RCM_IF_DEV(...)
#endif

/**
 * By default, only raise an NSAssertion in debug mode
 * (custom assert functions will still be called).
 */
#ifndef RCM_NSASSERT
#if RCM_DEBUG
#define RCM_NSASSERT 1
#else
#define RCM_NSASSERT 0
#endif
#endif

/**
 * Concat two literals. Supports macro expansions,
 * e.g. RCM_CONCAT(foo, __FILE__).
 */
#define RCM_CONCAT2(A, B) A ## B
#define RCM_CONCAT(A, B) RCM_CONCAT2(A, B)

/**
 * Throw an assertion for unimplemented methods.
 */
#define RCM_NOT_IMPLEMENTED(method) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wmissing-method-return-type\"") \
_Pragma("clang diagnostic ignored \"-Wunused-parameter\"") \
RCM_EXTERN NSException *_RCMNotImplementedException(SEL, Class); \
method NS_UNAVAILABLE { @throw _RCMNotImplementedException(_cmd, [self class]); } \
_Pragma("clang diagnostic pop")