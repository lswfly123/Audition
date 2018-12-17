//
//  ProtocolViewController.h
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProtocolDelegate<NSObject>
@required
- (void)eat:(NSString *)food;
- (void)drink;
@optional
- (void)readBook;
- (void)playBasketBall;
@end
@interface ProtocolViewController : UIViewController

@property (nonatomic,weak)id<ProtocolDelegate> deletage;
@end
