//
//  RuntimeViewController.m
//  News
//
//  Created by 李善武 on 2018/12/8.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "News-Swift.h"
//
/*
 * 1.是什么:
 *    底层的纯c语言的库
 * 2.作用:
 *    a.编写的OC代码在程序运行时都会转成runtime中的c代码,可以做一些非常底层的操作，例如：
 *    在程序运行过程中动态创建一个类(例如KVO的底层实现)，
 *    b.在程序运行过程中，动态的为某个类添加属性\方法,修改方法实现
 *    c.遍历一个对象的所有属性
 * 3.相关应用：
 *    a.字典转模型
 *    b.KVO底层实现
 *    c.用于封装框架
 * 4.相关函数：
 *    a.objc_msgSend:发送消息
 *    b.class_copyMethodList:遍历某个类的所有方法
 *    c.class_copyIvarList:遍历某个类的所有长远变量
 *
 *
 * 5.必备常识:
 *    a.Ivar：成员变量
 *    b.Method：成员方法
 **/
@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    Person *person = [[Person alloc]init];
    objc_msgSend(objc_msgSend(objc_msgSend([Person class], @selector(alloc)),@selector(init)), @selector(eatBreakfast));
    
    
//    id person = objc_msgSend([Person class],@selector(alloc));
    
}

@end
