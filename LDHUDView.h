//
//  LDHUDView.h
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 样式一的按钮回调
// 1.确定
typedef void(^LDHUDViewOneAlertViewClickSureBtnCallBack)();
// 2.取消
typedef void(^LDHUDViewOneAlertViewClickCancalBtnCallBack)();

#pragma mark - 样式二的隐藏回调
typedef void(^LDHUDViewTwoAlertViewHideCallBack)();

#pragma mark - 样式四的按钮回调
// 1.确定
typedef void(^LDHUDViewFourAlertViewClickSureBtnCallBack)(NSString *input);
// 2.取消
typedef void(^LDHUDViewFourAlertViewClickCancalBtnCallBack)();

#pragma mark - 样式五的按钮回调
// 1.确定
typedef void(^LDHUDViewFiveAlertViewClickSureBtnCallBack)();
// 2.取消
typedef void(^LDHUDViewFiveAlertViewClickCancalBtnCallBack)();

@interface LDHUDView : UIView

#pragma mark - 样式一：标题+内容+按钮(1个/2个)
// 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title message:(NSString *)message btnTextArray:(NSArray *)btnTextArray sureBtnCb:(LDHUDViewOneAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDViewOneAlertViewClickCancalBtnCallBack)cancalBtnCb;

#pragma mark - 样式二：标题+图标(可有可无)
// 初始化
- (instancetype)initWithFrame:(CGRect)frame icon:(NSString *)iconName text:(NSString *)text hideCb:(LDHUDViewTwoAlertViewHideCallBack)hideCb;

#pragma mark - 样式三：进度展示
// 1.初始化
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text;
// 2.隐藏
- (void)hideLDHUDViewThreeAlertView;

#pragma mark - 样式四：标题+文本框+按钮(2个)
// 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholderText:(NSString *)placeholder isSecureTextEntry:(BOOL)isSecureTextEntry sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(LDHUDViewFourAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDViewFourAlertViewClickCancalBtnCallBack)cancalBtnCb;

#pragma mark - 样式五：内容+按钮(2个)
// 初始化
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(LDHUDViewFiveAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDViewFiveAlertViewClickCancalBtnCallBack)cancalBtnCb;

@end
