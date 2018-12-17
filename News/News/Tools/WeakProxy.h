//
//  WeakProxy.h
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakProxy : NSProxy

@property(nonatomic,weak)id target;
@end
