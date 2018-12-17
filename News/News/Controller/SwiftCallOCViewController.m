//
//  SwiftCallOCViewController.m
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import "SwiftCallOCViewController.h"
#import "WeakProxy.h"
#import <objc/runtime.h>
#import "ProtocolDelegate.h"
#import "ProtocolViewController.h"
// NSTimer的循环引用:
//     表面上是：控制器->timer->控制器
//     实际上是：runLoop->timer
//     结果是：即使采用weakSelf也不能破除循环引用
@interface SwiftCallOCViewController ()<ProtocolDelegate>

@property (nonatomic,strong)WeakProxy *proxy;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSObject *target;

// block的循环引用
@property (nonatomic,strong)dispatch_block_t recycleBlock;
@end

@implementation SwiftCallOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /*************************NSTimer解决循环引用问题******************************/
    // 1.在didMoveToParentViewController:方法中将timer置为无效
    // 2.利用中间件来解决 RunLoop->timer->_target
//    _target = [NSObject new];
//    class_addMethod([_target class], @selector(timeCount), (IMP)fireIMP, "v@:");
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:_target selector:@selector(timeCount) userInfo:nil repeats:YES];
//    self.timer = timer;
//    [timer fire];
    // 3.通过引入NSProxy类，在NSProxy的子类中重写动态解析和消息转发的方法
//    self.proxy = [WeakProxy alloc];
//    self.proxy.target = self;
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self.proxy selector:@selector(timeCount) userInfo:nil repeats:YES];
//    self.timer = timer;
//    [timer fire];
    
    /*********************block解决循环引用问题************************/
//    __weak typeof(self) weakSelf = self;
//    self.recycleBlock= ^{
//        
//        __strong typeof(self) strongSelf = weakSelf;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"block执行了:%@",strongSelf);
//        });
//    };
//    self.recycleBlock();
    
    /*********************block解决循环引用问题************************/
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 代理解决循环引用，使用weak修饰
    ProtocolViewController *protocolVc = [[ProtocolViewController alloc]init];
    protocolVc.deletage = self;
    [self.navigationController pushViewController:protocolVc animated:YES];
}

void fireIMP(id self,SEL _cmd){
    
    NSLog(@"fireIMP开始运行了");
}

- (void)timeCount{
    
    NSLog(@"已经开始计时了");
}

- (void)fire{
    
    NSLog(@"fire开始调用");
}

- (void)dealloc{
    
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"控制器销毁了");
}

//- (void)didMoveToParentViewController:(UIViewController *)parent{
//    
//    if (parent == nil) {
//        
//        [self.timer invalidate];
//        self.timer = nil;
//    }
//}


- (void)eat:(NSString *)food{
    
    NSLog(@"今天吃了%@",food);
}
- (void)drink{
    
    NSLog(@"正在喝水");
}
@end
