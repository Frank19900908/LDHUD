//
//  TwoAlertView.h
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <UIKit/UIKit.h>

// 样式：标题+图标(可有可无)

@interface TwoAlertView : UIView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame icon:(NSString *)iconName text:(NSString *)text;

@end
