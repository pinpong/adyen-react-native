//
// Copyright (c) 2021 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//


#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(AdyenDropIn, NSObject)

RCT_EXTERN_METHOD(open:(nonnull NSDictionary *)paymentMethods
                  configuration:(nonnull NSDictionary *)configuration)

RCT_EXTERN_METHOD(hide:(nonnull NSNumber *)success
                  event:(nullable NSDictionary *)event)

RCT_EXTERN_METHOD(handle:(nonnull NSDictionary *)action)

RCT_EXTERN_METHOD(getReturnURL:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(update:(nullable NSArray *)results)

RCT_EXTERN_METHOD(confirm:(nonnull NSNumber *)success
                  address:(nullable NSDictionary *)address)

RCT_EXTERN_METHOD(removeStored:(nonnull NSNumber *)success)

RCT_EXTERN_METHOD(provideBalance:(nonnull NSNumber *)success
                  balance:(nullable NSDictionary *)balance
                  error:(nullable NSDictionary *)error)

RCT_EXTERN_METHOD(provideOrder:(nonnull NSNumber *)success
                  order:(nullable NSDictionary *)order
                  error:(nullable NSDictionary *)error)

RCT_EXTERN_METHOD(providePaymentMethods:(nonnull NSDictionary *)paymentMethods
                  order:(nullable NSDictionary *)order)



@end

@interface RCT_EXTERN_MODULE(AdyenInstant, NSObject)

RCT_EXTERN_METHOD(open:(NSDictionary *)paymentMethods
                  configuration:(NSDictionary *)configuration)

RCT_EXTERN_METHOD(hide:(nonnull NSNumber *)success
                  event:(NSDictionary *)event)

RCT_EXTERN_METHOD(handle:(NSDictionary *)action)

@end

@interface RCT_EXTERN_MODULE(AdyenApplePay, NSObject)

RCT_EXTERN_METHOD(open:(NSDictionary *)paymentMethods
                  configuration:(NSDictionary *)configuration)

RCT_EXTERN_METHOD(hide:(nonnull NSNumber *)success
                  event:(NSDictionary *)event)

@end

// Mock to prevent NativeModule check failure
@interface RCT_EXTERN_MODULE(AdyenGooglePay, NSObject)

RCT_EXTERN_METHOD(open:(NSDictionary *)paymentMethods
                  configuration:(NSDictionary *)configuration)

@end

@interface RCT_EXTERN_MODULE(AdyenCSE, NSObject)

RCT_EXTERN_METHOD(encryptCard:(NSDictionary *)card
                  publicKey:(NSString *)publicKey
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(encryptBin:(NSString *)bin
                  publicKey:(NSString *)publicKey
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

@end

@interface RCT_EXTERN_MODULE(SessionHelper, NSObject)

RCT_EXTERN_METHOD(createSession:(NSDictionary *)sessionModelJSON
                  configuration:(NSDictionary *)configurationJSON
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(hide:(nonnull NSNumber *)success
                  event:(NSDictionary *)event)

@end

@interface RCT_EXTERN_MODULE(AdyenAction, NSObject)

RCT_EXTERN_METHOD(hide:(nonnull NSNumber *)success)

RCT_EXTERN_METHOD(handle:(NSDictionary *)action
                  configuration:(NSDictionary *)configurationJSON
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

@end


