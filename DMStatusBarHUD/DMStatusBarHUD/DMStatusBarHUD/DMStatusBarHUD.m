//
//  DMStatusBarHUD.m
//  DMStatusBarHUD
//
//  Created by 戴明亮 on 17/5/14.
//  Copyright © 2017年 戴明亮. All rights reserved.
//

#import "DMStatusBarHUD.h"
#import "DMProcessView.h"
static DMStatusBarHUD *_shared = nil;

@interface DMStatusBarHUD (){
    /** 全局的窗口 */
     UIWindow *window_;
    DMProcessView *processView_;
}

@end

@implementation DMStatusBarHUD


+ (instancetype)sharedManager {
    
    if (_shared == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _shared = [[DMStatusBarHUD alloc] init];
        });
    }
    return _shared;
}

- (void)showWindow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:2.0 animations:^{
        window_.frame = frame;
    }];
}


// 显示
- (void)showProgress
{
    // 显示窗口
    [self showWindow];
    
    processView_ = [[DMProcessView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    processView_.percent = 0;
    [window_ addSubview:processView_];
}

// 隐藏
- (void)hide
{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        
    }];
}


- (void)setProgress:(CGFloat)progress
{
    _progress = progress ;
    processView_.percent = progress;
    
   
    if (_progress >= 100.f) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hide];
        });
        
    }
}



@end
