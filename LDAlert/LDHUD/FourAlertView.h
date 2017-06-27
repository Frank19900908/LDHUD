//
//  FourAlertView.h
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <UIKit/UIKit.h>

// 样式：标题+文本框+按钮(2个)

#pragma mark - 按钮的回调
// 1.确定
typedef void(^FourAlertViewClickSureBtnCallBack)(NSString *input);
// 2.取消
typedef void(^FourAlertViewClickCancalBtnCallBack)();

@interface FourAlertView : UIView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholderText:(NSString *)placeholder isSecureTextEntry:(BOOL)isSecureTextEntry sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(FourAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(FourAlertViewClickCancalBtnCallBack)cancalBtnCb;

@end
