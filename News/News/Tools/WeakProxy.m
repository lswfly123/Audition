//
//  WeakProxy.m
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy

// 动态解析
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    
    return [self.target methodSignatureForSelector:sel];
}

// 动态方法
- (void)forwardInvocation:(NSInvocation *)invocation{
    
    [invocation invokeWithTarget:self.target];
}
@end
