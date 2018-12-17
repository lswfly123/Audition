//
//  BlueView.m
//  News
//
//  Created by 李善武 on 2018/12/10.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    return  [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

@end
