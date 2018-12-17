
//
//  GreenView.m
//  News
//
//  Created by 李善武 on 2018/12/10.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "GreenView.h"

@implementation GreenView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    return  self.subviews[0];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

@end
