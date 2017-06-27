//
//  LDHUDTool.m
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "LDHUDTool.h"
#import "LDHUDView.h"

@implementation LDHUDTool

#pragma mark - 样式一：标题+内容+按钮(1个/2个)
+ (void)showHUDWithTitle:(NSString *)title message:(NSString *)message btnTextArray:(NSArray *)btnTextArray sureBtnCb:(LDHUDToolOneAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDToolOneAlertViewClickCancalBtnCallBack)cancalBtnCb
{
    // hudView
    LDHUDView *hudView = [[LDHUDView alloc] initWithFrame:[UIScreen mainScreen].bounds title:title message:message btnTextArray:btnTextArray sureBtnCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:2];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
        if (sureBtnCb) {
            sureBtnCb();
        }
    } cancalBtnCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:2];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
        if (cancalBtnCb) {
            cancalBtnCb();
        }
    }];
    hudView.tag = 2;
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
}

#pragma mark - 样式二：标题+图标
// 1.成功
+ (void)showHUDWithSuccessText:(NSString *)text
{
    // hudView
    LDHUDView *hudView = [[LDHUDView alloc] initWithFrame:[UIScreen mainScreen].bounds icon:@"success" text:text hideCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:3];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
    }];
    hudView.tag = 3;
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
}
// 2.失败
+ (void)showHUDWithErrorText:(NSString *)text
{
    // hudView
    LDHUDView *hudView = [[LDHUDView alloc] initWithFrame:[UIScreen mainScreen].bounds icon:@"error" text:text hideCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:4];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
    }];
    hudView.tag = 4;
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
}
// 3.信息展示
+ (void)showHUDWithText:(NSString *)text
{
    // hudView
    LDHUDView *hudView = [[LDHUDView alloc] initWithFrame:[UIScreen mainScreen].bounds icon:nil text:text hideCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:5];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
    }];
    hudView.tag = 5;
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
}

#pragma mark - 样式三：进度展示
// 1.显示
+ (void)showHUDWithProgressText:(NSString *)text
{
    // hudView
    LDHUDView *hudView = [[LDHUDView alloc] initWithFrame:[UIScreen mainScreen].bounds text:text];
    hudView.tag = 6;
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
}
// 2.隐藏
+ (void)hideHUDWithProgress
{
    LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:6];
    [hudView hideLDHUDViewThreeAlertView];
    [UIView animateWithDuration:0.5 animations:^{
        hudView.alpha = 0;
    } completion:^(BOOL finished) {
        [hudView removeFromSuperview];
    }];
}

#pragma mark - 样式四：标题+文本框+按钮(2个)
+ (void)showHUDWithTitle:(NSString *)title placeholderText:(NSString *)placeholder isSecureTextEntry:(BOOL)isSecureTextEntry sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(LDHUDToolFourAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDToolFourAlertViewClickCancalBtnCallBack)cancalBtnCb
{
    // hudView
    LDHUDView *hudView = [[LDHUDView alloc] initWithFrame:[UIScreen mainScreen].bounds title:title placeholderText:placeholder isSecureTextEntry:isSecureTextEntry sureBtnText:sureBtnText cancalBtnText:cancalBtnText sureBtnCb:^(NSString *input) {
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:7];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
        if (sureBtnCb) {
            sureBtnCb(input);
        }
    } cancalBtnCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:7];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
        if (cancalBtnCb) {
            cancalBtnCb();
        }
    }];
    hudView.tag = 7;
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
}

#pragma mark - 样式五：内容+按钮(2个)
+ (void)showHUDWithText:(NSString *)text sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(LDHUDToolFiveAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDToolFiveAlertViewClickCancalBtnCallBack)cancalBtnCb
{
    // hudView
    LDHUDView *hudView = [[LDHUDView alloc] initWithFrame:[UIScreen mainScreen].bounds text:text sureBtnText:sureBtnText cancalBtnText:cancalBtnText sureBtnCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:8];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
        if (sureBtnCb) {
            sureBtnCb();
        }
    } cancalBtnCb:^{
        LDHUDView *hudView = [[UIApplication sharedApplication].keyWindow viewWithTag:8];
        [UIView animateWithDuration:0.5 animations:^{
            hudView.alpha = 0;
        } completion:^(BOOL finished) {
            [hudView removeFromSuperview];
        }];
        if (cancalBtnCb) {
            cancalBtnCb();
        }
    }];
    hudView.tag = 8;
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
}

@end
