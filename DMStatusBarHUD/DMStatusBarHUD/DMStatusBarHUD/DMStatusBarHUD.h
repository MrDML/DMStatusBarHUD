//
//  DMStatusBarHUD.h
//  DMStatusBarHUD
//
//  Created by 戴明亮 on 17/5/14.
//  Copyright © 2017年 戴明亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMStatusBarHUD : NSObject
+ (instancetype)sharedManager;
@property (nonatomic, assign) CGFloat progress;
- (void)showProgress;
- (void)hide;
@end
