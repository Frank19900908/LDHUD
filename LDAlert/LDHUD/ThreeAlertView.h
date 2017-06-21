//
//  ThreeAlertView.h
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <UIKit/UIKit.h>

// 样式：进度展示

@interface ThreeAlertView : UIView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text;

#pragma mark - 停止菊花动画
- (void)stopIndicatorViewAnimation;

@end
