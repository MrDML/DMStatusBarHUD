//
//  DMProcessView.m
//  DMStatusBarHUD
//
//  Created by 戴明亮 on 17/5/14.
//  Copyright © 2017年 戴明亮. All rights reserved.
//

#import "DMProcessView.h"

@interface DMProcessView ()
@property (nonatomic, strong) UIView *bg_View;
@property (nonatomic, strong) UIView *left_View;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGFloat numberPercent;
@end

@implementation DMProcessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:68/255.0 blue:4/255.0 alpha:1];
        [self setupSubViews];
        
        
    }
    
    return self;
}




- (void)setupSubViews
{
    _bg_View = [[UIView alloc] init];
    _bg_View.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 5);
    _bg_View.backgroundColor = [UIColor grayColor];
    [self addSubview:_bg_View];
    
    
    _left_View = [[UIView alloc] init];
    _left_View.frame = CGRectMake(0, 0, 0, 5);
    _left_View.layer.cornerRadius = 2.5;
    _left_View.clipsToBounds = YES;
    _left_View.backgroundColor = [UIColor blueColor];
    [self addSubview:_left_View];
    
    
    
    _label = [[UILabel alloc] init];
    _label.frame = CGRectMake(0, CGRectGetMaxY(_bg_View.frame), 60, 15);
    _label.font  = [UIFont systemFontOfSize:12];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentRight;
    //_label.backgroundColor = [UIColor brownColor];
    [self addSubview:_label];
    
    
    
    
}


- (void)setPercent:(CGFloat)percent {
    [self setPercent:percent animated:YES];
}



- (void)setPercent:(CGFloat)percent animated:(BOOL)animated {
    
    _percent = percent;
    NSLog(@"--> %f",_percent);
    // 文字动画
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1.0 animations:^{
        
        weakSelf.label.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 60) * percent / 100, CGRectGetMaxY(self.bg_View.frame), 60, 15);
        
        self.left_View.frame = CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width) * _percent / 100.f, 5);
        
        self.label.text = [NSString stringWithFormat:@"%.1f%%",_percent];
    }];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
