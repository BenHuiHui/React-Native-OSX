//
//  RCTBridgeModule.h
//  ReactNativeOSX
//
//  Created by Hui Hui on 27/9/15.
//  Modified from RCTBridgeModule.h
//

#import <Foundation/Foundation.h>

#import "RCTDefines"

@class RCTBridgeOSX;

typedef void (^RCTResponseSenderBlock)(NSArray *response);

typedef void (^RCTResponseErrorBlock)(NSError *error);

typedef void (^RCTPromiseResolveBlock)(id result);

typedef void (^RCTPromiseRejectBlock)(NSError *error);

extern dispatch_queue_t RCTJSThread;


@protocol RCTBridgeModuleOSX <NSObject>

//TODO: Exam behavior
#define RCT_EXPORT_MODULE(js_name) \
RCT_EXTERN void RCTRegisterModule(Class); \
+ (NSString *)moduleName { return @#js_name; } \
+ (void)load { RCTRegisterModule(self); }

+ (NSString *)moduleName;

@optional

@property (nonatomic, weak) RCTBridge *bridge;

@property (nonatomic, strong, readonly) dispatch_queue_t methodQueue;

#define RCT_EXPORT_METHOD(method) \
RCT_REMAP_METHOD(, method)

#define RCT_REMAP_METHOD(js_name, method) \
RCT_EXTERN_REMAP_METHOD(js_name, method) \
- (void)method

#define RCT_EXTERN_MODULE(objc_name, objc_supername) \
RCT_EXTERN_REMAP_MODULE(, objc_name, objc_supername)

#define RCT_EXTERN_REMAP_MODULE(js_name, objc_name, objc_supername) \
objc_name : objc_supername \
@end \
@interface objc_name (RCTExternModule) <RCTBridgeModule> \
@end \
@implementation objc_name (RCTExternModule) \
RCT_EXPORT_MODULE(js_name)

#define RCT_EXTERN_METHOD(method) \
RCT_EXTERN_REMAP_METHOD(, method)

#define RCT_EXTERN_REMAP_METHOD(js_name, method) \
+ (NSArray *)RCT_CONCAT(__rct_export__, RCT_CONCAT(js_name, RCT_CONCAT(__LINE__, __COUNTER__))) { \
return @[@#js_name, @#method]; \
} \

- (NSDictionary *)constantsToExport;

- (void)batchDidComplete;

@end