//
//  Student.m
//  News
//
//  Created by 李善武 on 2018/12/8.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@interface Student()<NSCoding>


@end
@implementation Student

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count;
    Ivar *ivar = class_copyIvarList([Student class], &count);
    for (int i=0; i<count; i++) {
        Ivar iv = ivar[i];
        const char *name = ivar_getName(iv);
        NSString *strName = [NSString stringWithUTF8String:name];
        //利用KVC取值
        id value = [self valueForKey:strName];
        [aCoder encodeObject:value forKey:strName];
    }
    free(ivar);
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
        unsigned int count = 0;
        Ivar *ivar = class_copyIvarList([Student class], &count);
        for (int i=0; i<count; i++) {
            
            Ivar iva = ivar[i];
            const char *ivarName = ivar_getName(iva);
            NSString *strName = [NSString stringWithUTF8String:ivarName];
            // 进行解档
            id value = [coder decodeObjectForKey:strName];
            //利用KVC对属性赋值
            [self setValue:value forKey:strName];
        }
        free(ivar);
    }
    return self;
}

@end
