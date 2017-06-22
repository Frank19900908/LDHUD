//
//  FiveAlertView.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "FiveAlertView.h"

@interface FiveAlertView ()

@property (nonatomic, copy) FiveAlertViewClickSureBtnCallBack sureBtnCallBack;
@property (nonatomic, copy) FiveAlertViewClickCancalBtnCallBack cancalBtnCallBack;

@end

@implementation FiveAlertView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(FiveAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(FiveAlertViewClickCancalBtnCallBack)cancalBtnCb
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        // 回调
        self.sureBtnCallBack = sureBtnCb;
        self.cancalBtnCallBack = cancalBtnCb;
        // cancalBtn
        CGFloat cancalBtnW = self.bounds.size.width / 2.0;
        CGFloat cancalBtnH = 45;
        CGFloat cancalBtnX = 0;
        CGFloat cancalBtnY = self.bounds.size.height - cancalBtnH;
        UIButton *cancalBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        cancalBtn.frame = CGRectMake(cancalBtnX, cancalBtnY, cancalBtnW, cancalBtnH);
        [cancalBtn setTitle:cancalBtnText forState:UIControlStateNormal];
        cancalBtn.tintColor = [UIColor lightGrayColor];
        cancalBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [cancalBtn addTarget:self action:@selector(cancalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancalBtn];
        // lineView
        CGFloat lineViewW = self.bounds.size.width;
        CGFloat lineViewH = 0.5;
        CGFloat lineViewX = cancalBtn.frame.origin.x;
        CGFloat lineViewY = cancalBtn.frame.origin.y;
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(lineViewX, lineViewY, lineViewW, lineViewH)];
        lineView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];
        [self addSubview:lineView];
        // sureBtn
        CGFloat sureBtnX = CGRectGetMaxX(cancalBtn.frame);
        CGFloat sureBtnY = cancalBtn.frame.origin.y;
        CGFloat sureBtnW = cancalBtn.bounds.size.width;
        CGFloat sureBtnH = cancalBtn.bounds.size.height;
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        sureBtn.frame = CGRectMake(sureBtnX, sureBtnY, sureBtnW, sureBtnH);
        [sureBtn setTitle:sureBtnText forState:UIControlStateNormal];
        sureBtn.tintColor = [UIColor whiteColor];
        sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        sureBtn.backgroundColor = [UIColor redColor];
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sureBtn];
        // textLabel
        CGFloat textLabelX = 15;
        CGFloat textLabelY = 0;
        CGFloat textLabelW = self.bounds.size.width - textLabelX * 2;
        CGFloat textLabelH = self.bounds.size.height - sureBtn.bounds.size.height;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)];
        textLabel.text = text;
        textLabel.textColor = [UIColor grayColor];
        textLabel.font = [UIFont boldSystemFontOfSize:16];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
    }
    return self;
}

#pragma mark - 按钮点击事件
// 1.确定
- (void)sureBtnClick:(UIButton *)sender
{
    if (self.sureBtnCallBack) {
        self.sureBtnCallBack();
    }
}
// 2.取消
- (void)cancalBtnClick:(UIButton *)sender
{
    if (self.cancalBtnCallBack) {
        self.cancalBtnCallBack();
    }
}

@end
