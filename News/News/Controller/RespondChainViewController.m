//
//  RespondChainViewController.m
//  News
//
//  Created by 李善武 on 2018/12/10.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "RespondChainViewController.h"
#import "OrangeView.h"
#import "GreenView.h"
#import "BlueView.h"
@interface RespondChainViewController ()

@end

@implementation RespondChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMyView];
}

- (void)initMyView{// 初始化view
    
    self.view.backgroundColor = [UIColor whiteColor];
    OrangeView *orangeView = [[OrangeView alloc]initWithFrame:CGRectMake(50, 100, 250, 350)];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    
    GreenView *greenView = [[GreenView alloc]initWithFrame:CGRectMake(50, 50, 150, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    [orangeView addSubview:greenView];
    
    BlueView *blueView = [[BlueView alloc]initWithFrame:CGRectMake(100, 180, 100, 80)];
    blueView.backgroundColor = [UIColor blueColor];
    [orangeView addSubview:blueView];
}
@end
