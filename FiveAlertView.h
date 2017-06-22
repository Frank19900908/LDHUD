//
//  FiveAlertView.h
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <UIKit/UIKit.h>

// 样式：内容+按钮(2个)

#pragma mark - 按钮的回调
// 1.确定
typedef void(^FiveAlertViewClickSureBtnCallBack)();
// 2.取消
typedef void(^FiveAlertViewClickCancalBtnCallBack)();

@interface FiveAlertView : UIView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(FiveAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(FiveAlertViewClickCancalBtnCallBack)cancalBtnCb;

@end
