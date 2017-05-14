//
//  ViewController.m
//  DMStatusBarHUD
//
//  Created by 戴明亮 on 17/5/14.
//  Copyright © 2017年 戴明亮. All rights reserved.
//

#import "ViewController.h"
#import "DMStatusBarHUD.h"
@interface ViewController ()
@property(nonatomic,assign)CGFloat value;
@property (nonatomic,strong)  NSTimer *timer ;
@property (nonatomic, strong)DMStatusBarHUD *StatusBarHUD ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _value = 0.f;
}


- (void)ontime
{
    _value ++;
    NSLog(@"-------------------------->%f",_value);
    if (_value > 100) {
        [_timer invalidate];
        _timer = nil;
        _value = 0;
    }else{
        self.StatusBarHUD.progress = _value * 1.0;
    }
    
}

- (IBAction)upload:(id)sender {
    
    if (self.timer == nil) {
        DMStatusBarHUD *StatusBarHUD =  [DMStatusBarHUD sharedManager];
        self.StatusBarHUD = StatusBarHUD;
        [self.StatusBarHUD showProgress];
//        self.StatusBarHUD.progress = 49;
        
        NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(ontime) userInfo:nil repeats:YES];
        self.timer = timer;
    }else{
        NSLog(@"====");
    }
    
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
