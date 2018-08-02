//
//  Person.m
//  LRQMessageForwarding
//
//  Created by Maskkk on 2018/8/2.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "Person.h"
#import "Student.h"
#import <objc/runtime.h>
@implementation Person

// //优先调用
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"resolveInstanceMethod");
//    //动态添加方法实现,将 Student 的 test 实现,来添加到 Person 的实现中.
//    Method m = class_getInstanceMethod([Student class], @selector(test));
//    IMP newImp = class_getMethodImplementation([Student class], @selector(test));
//    const char * method_typeCoding = method_getTypeEncoding(m);
//    class_addMethod([self class], sel, newImp, method_typeCoding);
//    return YES;
//}

// 转发给某个对象进行响应.其次调用
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"forwardingTargetForSelector");
//
//    if ([[Student new] respondsToSelector:@selector(test)]) {
//        return [Student new];
//    }
//    return self;
//}


/// 下面这两个方法是一起调用的.
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"methodSignatureForSelector");
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [[Student new] methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
    Student *s = [Student new];
    [anInvocation invokeWithTarget:s];
}

@end
