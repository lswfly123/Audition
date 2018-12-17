//
//  BlockViewController.m
//  News
//
//  Created by 李善武 on 2018/12/8.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self test1];
    [self test2];
    [self test3];
    [self test4];
}

- (void)test1{
    
    int a=10;
    void (^block)()=^{
        
        NSLog(@"捕获的值1:%d",a);
    };
    
    a=20;
    block();
}

- (void)test2{
    
    __block int a=10;
    void (^block)()=^{
        
        NSLog(@"捕获的值2:%d",a);
    };
    
    a=20;
    block();
}

- (void)test3{
    
    static int a=10;
    void (^block)()=^{
        
        NSLog(@"捕获的值3:%d",a);
    };
    
    a=20;
    block();
}

int a=10;
- (void)test4{
    
    void (^block)()=^{
        
        NSLog(@"捕获的值4:%d",a);
    };
    
    a=20;
    block();
}
@end
