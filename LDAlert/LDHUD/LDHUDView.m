//
//  LDHUDView.m
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "LDHUDView.h"
#import "LDTool.h"
#import "OneAlertView.h"
#import "TwoAlertView.h"
#import "ThreeAlertView.h"
#import "FourAlertView.h"

@implementation LDHUDView

#pragma mark - 样式：标题+内容+按钮(1个/2个)
// 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title message:(NSString *)message btnTextArray:(NSArray *)btnTextArray sureBtnCb:(LDHUDViewOneAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDViewOneAlertViewClickCancalBtnCallBack)cancalBtnCb;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:0.8];
        // oneAlertView
        CGFloat oneAlertViewW = 250;
        CGFloat oneAlertViewH = 160;
        CGFloat oneAlertViewX = (self.bounds.size.width - oneAlertViewW) / 2.0;
        CGFloat oneAlertViewY = -oneAlertViewH;
        OneAlertView *oneAlertView = [[OneAlertView alloc] initWithFrame:CGRectMake(oneAlertViewX, oneAlertViewY, oneAlertViewW, oneAlertViewH) title:title message:message btnTextArray:btnTextArray sureBtnCb:^{
            OneAlertView *oneAlertView = [self viewWithTag:1000];
            [UIView animateWithDuration:0.5 animations:^{
                oneAlertView.frame = CGRectMake(oneAlertView.frame.origin.x, self.bounds.size.height, oneAlertView.bounds.size.width, oneAlertView.bounds.size.height);
            } completion:^(BOOL finished) {
                [oneAlertView removeFromSuperview];
            }];
            if (sureBtnCb) {
                sureBtnCb();
            }
        } cancalBtnCb:^{
            OneAlertView *oneAlertView = [self viewWithTag:1000];
            [UIView animateWithDuration:0.5 animations:^{
                oneAlertView.frame = CGRectMake(oneAlertView.frame.origin.x, self.bounds.size.height, oneAlertView.bounds.size.width, oneAlertView.bounds.size.height);
            } completion:^(BOOL finished) {
                [oneAlertView removeFromSuperview];
            }];
            if (cancalBtnCb) {
                cancalBtnCb();
            }
        }];
        oneAlertView.tag = 1000;
        [self addSubview:oneAlertView];
        [UIView animateWithDuration:0.65 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
            oneAlertView.frame = CGRectMake(oneAlertView.frame.origin.x, (self.bounds.size.height - oneAlertView.bounds.size.height) / 2.0, oneAlertView.bounds.size.width, oneAlertView.bounds.size.height);
        } completion:nil];
    }
    return self;
}

#pragma mark - 样式二：标题+图标(可有可无)
// 初始化
- (instancetype)initWithFrame:(CGRect)frame icon:(NSString *)iconName text:(NSString *)text hideCb:(LDHUDViewTwoAlertViewHideCallBack)hideCb
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        BOOL isIcon = iconName == nil ? NO : YES;
        // twoAlertView
        CGFloat textW = [LDTool widthOfText:text font:[UIFont systemFontOfSize:18] maxSize:CGSizeMake(MAXFLOAT, 30)].width;
        CGFloat twoAlertViewW = isIcon ? 120 : textW;
        CGFloat twoAlertViewH = isIcon ? 120 : 50;
        CGFloat twoAlertViewX = (self.bounds.size.width - twoAlertViewW) / 2.0;
        CGFloat twoAlertViewY = (self.bounds.size.height - twoAlertViewH) / 2.0;
        TwoAlertView *twoAlertView = [[TwoAlertView alloc] initWithFrame:CGRectMake(twoAlertViewX, twoAlertViewY, twoAlertViewW, twoAlertViewH) icon:iconName text:text];
        [self addSubview:twoAlertView];
        [UIView animateWithDuration:1 animations:^{
            twoAlertView.alpha = 1;
        }];
        [UIView animateWithDuration:0.5 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
            twoAlertView.frame = CGRectMake(twoAlertView.frame.origin.x, self.bounds.size.height, twoAlertView.bounds.size.width, twoAlertView.bounds.size.height);
        } completion:^(BOOL finished) {
            [twoAlertView removeFromSuperview];
            if (hideCb) {
                hideCb();
            }
        }];
    }
    return self;
}

#pragma mark - 样式三：进度展示
// 1.初始化
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:210.0/255.0 green:210.0/255.0 blue:210.0/255.0 alpha:0.8];
        // threeAlertView
        CGFloat threeAlertViewW = 120;
        CGFloat threeAlertViewH = 120;
        CGFloat threeAlertViewX = (self.bounds.size.width - threeAlertViewW) / 2.0;
        CGFloat threeAlertViewY = -threeAlertViewH;
        ThreeAlertView *threeAlertView = [[ThreeAlertView alloc] initWithFrame:CGRectMake(threeAlertViewX, threeAlertViewY, threeAlertViewW, threeAlertViewH) text:text];
        threeAlertView.tag = 1001;
        [self addSubview:threeAlertView];
        [UIView animateWithDuration:0.5 animations:^{
            threeAlertView.frame = CGRectMake(threeAlertView.frame.origin.x, (self.bounds.size.height - threeAlertViewH) / 2.0, threeAlertView.bounds.size.width, threeAlertView.bounds.size.height);
        }];
    }
    return self;
}
// 2.隐藏
- (void)hideLDHUDViewThreeAlertView
{
    ThreeAlertView *threeAlertView = [self viewWithTag:1001];
    [threeAlertView stopIndicatorViewAnimation];
    [UIView animateWithDuration:0.5 animations:^{
        threeAlertView.alpha = 0;
    } completion:^(BOOL finished) {
        [threeAlertView removeFromSuperview];
    }];
}

#pragma mark - 样式四：标题+文本框+按钮(2个)
// 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholderText:(NSString *)placeholder isSecureTextEntry:(BOOL)isSecureTextEntry sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(LDHUDViewFourAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(LDHUDViewFourAlertViewClickCancalBtnCallBack)cancalBtnCb
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:0.8];
        // fourAlertView
        CGFloat fourAlertViewW = 280;
        CGFloat fourAlertViewH = 150;
        CGFloat fourAlertViewX = (self.bounds.size.width - fourAlertViewW) / 2.0;
        CGFloat fourAlertViewY = -fourAlertViewH;
        FourAlertView *fourAlertView = [[FourAlertView alloc] initWithFrame:CGRectMake(fourAlertViewX, fourAlertViewY, fourAlertViewW, fourAlertViewH) title:title placeholderText:placeholder isSecureTextEntry:isSecureTextEntry sureBtnText:sureBtnText cancalBtnText:cancalBtnText sureBtnCb:^(NSString *input) {
            OneAlertView *fourAlertView = [self viewWithTag:1002];
            [UIView animateWithDuration:0.5 animations:^{
                fourAlertView.frame = CGRectMake(fourAlertView.frame.origin.x, self.bounds.size.height, fourAlertView.bounds.size.width, fourAlertView.bounds.size.height);
            } completion:^(BOOL finished) {
                [fourAlertView removeFromSuperview];
            }];
            if (sureBtnCb) {
                sureBtnCb(input);
            }
        } cancalBtnCb:^{
            OneAlertView *fourAlertView = [self viewWithTag:1002];
            [UIView animateWithDuration:0.5 animations:^{
                fourAlertView.frame = CGRectMake(fourAlertView.frame.origin.x, self.bounds.size.height, fourAlertView.bounds.size.width, fourAlertView.bounds.size.height);
            } completion:^(BOOL finished) {
                [fourAlertView removeFromSuperview];
            }];
            if (cancalBtnCb) {
                cancalBtnCb();
            }
        }];
        fourAlertView.tag = 1002;
        [self addSubview:fourAlertView];
        [UIView animateWithDuration:0.65 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
            fourAlertView.frame = CGRectMake(fourAlertView.frame.origin.x, (self.bounds.size.height - fourAlertView.bounds.size.height) / 2.0, fourAlertView.bounds.size.width, fourAlertView.bounds.size.height);
        } completion:nil];
    }
    return self;
}

#pragma mark - 点击空白
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
