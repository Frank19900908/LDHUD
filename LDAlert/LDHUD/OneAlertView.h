//
//  OneAlertView.h
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <UIKit/UIKit.h>

// 样式：标题+内容+按钮(1个/2个)

#pragma mark - 按钮的回调
// 1.确认
typedef void(^OneAlertViewClickSureBtnCallBack)();
// 2.取消
typedef void(^OneAlertViewClickCancalBtnCallBack)();

@interface OneAlertView : UIView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title message:(NSString *)message btnTextArray:(NSArray *)btnTextArray sureBtnCb:(OneAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(OneAlertViewClickCancalBtnCallBack)cancalBtnCb;

@end
