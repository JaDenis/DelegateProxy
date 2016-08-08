//
//  DPRuntime.h
//  DelegateProxy
//
//  Created by Ryo Aoyama on 8/5/16.
//  Copyright © 2016 Ryo Aoyama. All rights reserved.
//

BOOL isMethodReturnTypeVoid(struct objc_method_description method);

BOOL isMethodSignatureVoid(NSMethodSignature * _Nonnull methodSignature);

NSArray * _Nonnull argumentsFromInvocation(NSInvocation * _Nonnull invocation);