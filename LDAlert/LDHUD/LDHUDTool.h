//
//  LDHUDTool.h
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 样式一的按钮回调
// 1.确定
typedef void(^LDHUDToolOneAlertViewClickSureBtnCallBack)();
// 2.取消
typedef void(^LDHUDToolOneAlertViewClickCancalBtnCallBack)();

#pragma mark - 样式四的按钮回调
// 1.确定
typedef void(^LDHUDToolFourAlertViewClickSureBtnCallBack)(NSString *input);
// 2.取消
typedef void(^LDHUDToolFourAlertViewClickCancalBtnCallBack)();

#pragma mark - 样式五的按钮回调
// 1.确定
typedef void(^LDHUDToolFiveAlertViewClickSureBtnCallBack)();
// 2.取消
typedef void(^LDHUDToolFiveAlertViewClickCancalBtnCallBack)();

@interface LDHUDTool : NSObject

#pragma mark - 样式一：标题+内容+按钮(1个/2个)
// 参数1：title 标题(可以为nil)
// 参数2：message 消息提示(可以为nil)
// 参数3：btnTextArray 按钮数组(如：@[@"确定", @"取消"]，当然也可以只传一个，但是不能为nil)
// 参数4：sureBtnCb 确定按钮回调(可以为nil)
// 参数5：cancalBtnCb 取消按钮回调(可以为nil)
+ (void)showHUDWithTitle:(NSString *)title message:(NSString *)message btnTextArray:(NSArray *)btnTextArray sureBtnCb:(LDHUDToolOneAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDToolOneAlertViewClickCancalBtnCallBack)cancalBtnCb;

#pragma mark - 样式二：标题+图标
// 1.成功
// 参数：text 文本
+ (void)showHUDWithSuccessText:(NSString *)text;
// 2.失败
// 参数：text 文本
+ (void)showHUDWithErrorText:(NSString *)text;
// 3.信息展示
// 参数：text 文本
+ (void)showHUDWithText:(NSString *)text;

#pragma mark - 样式三：进度展示
// 1.显示
// 参数：text 文本
+ (void)showHUDWithProgressText:(NSString *)text;
// 2.隐藏
+ (void)hideHUDWithProgress;

#pragma mark - 样式四：标题+文本框+按钮(2个)
// 参数1：title 标题(可以为nil)
// 参数2：placeholder 文本输入框提示
// 参数3：isSecureTextEntry 是否密文输入(YES:密文/NO:明文)
// 参数4：sureBtnText 确定按钮显示文字
// 参数5：cancalBtnText 取消按钮显示文字
// 参数6：sureBtnCb 确定按钮回调(可以为nil)
// 参数7：cancalBtnCb 取消按钮回调(可以为nil)
+ (void)showHUDWithTitle:(NSString *)title placeholderText:(NSString *)placeholder isSecureTextEntry:(BOOL)isSecureTextEntry sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(LDHUDToolFourAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDToolFourAlertViewClickCancalBtnCallBack)cancalBtnCb;

#pragma mark - 样式五：内容+按钮(2个)
// 参数1：text 文本
// 参数2：sureBtnText 确定按钮显示文字
// 参数3：cancalBtnText 取消按钮显示文字
// 参数4：sureBtnCb 确定按钮回调(可以为nil)
// 参数5：cancalBtnCb 取消按钮回调(可以为nil)
+ (void)showHUDWithText:(NSString *)text sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(LDHUDToolFiveAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDToolFiveAlertViewClickCancalBtnCallBack)cancalBtnCb;

@end
