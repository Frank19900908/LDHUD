//
//  OneAlertView.m
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "OneAlertView.h"

@interface OneAlertView ()

@property (nonatomic, copy) OneAlertViewClickSureBtnCallBack sureBtnCallBack;
@property (nonatomic, copy) OneAlertViewClickCancalBtnCallBack cancalBtnCallBack;

@end

@implementation OneAlertView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title message:(NSString *)message btnTextArray:(NSArray *)btnTextArray sureBtnCb:(OneAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(OneAlertViewClickCancalBtnCallBack)cancalBtnCb
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        // 回调
        self.sureBtnCallBack = sureBtnCb;
        self.cancalBtnCallBack = cancalBtnCb;
        // 判断按钮的个数
        BOOL isCancalBtn = btnTextArray.count == 1 ? NO : YES;
        // sureBtn
        CGFloat sureBtnW = isCancalBtn ? (self.bounds.size.width - 0.5) / 2.0 : self.bounds.size.width;
        CGFloat sureBtnH = 45;
        CGFloat sureBtnX = 0;
        CGFloat sureBtnY = self.bounds.size.height - sureBtnH;
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        sureBtn.frame = CGRectMake(sureBtnX, sureBtnY, sureBtnW, sureBtnH);
        [sureBtn setTitle:btnTextArray[0] forState:UIControlStateNormal];
        sureBtn.tintColor = [UIColor blueColor];
        sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sureBtn];
        if (isCancalBtn) {
            // cancalBtn
            CGFloat cancalBtnW = sureBtn.bounds.size.width;
            CGFloat cancalBtnH = sureBtn.bounds.size.height;
            CGFloat cancalBtnX = self.bounds.size.width - cancalBtnW;
            CGFloat cancalBtnY = sureBtn.frame.origin.y;
            UIButton *cancalBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            cancalBtn.frame = CGRectMake(cancalBtnX, cancalBtnY, cancalBtnW, cancalBtnH);
            [cancalBtn setTitle:btnTextArray[1] forState:UIControlStateNormal];
            cancalBtn.tintColor = [UIColor redColor];
            cancalBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [cancalBtn addTarget:self action:@selector(cancalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:cancalBtn];
            // lineHView
            CGFloat lineHViewX = CGRectGetMaxX(sureBtn.frame);
            CGFloat lineHViewY = sureBtn.frame.origin.y;
            CGFloat lineHViewW = 0.5;
            CGFloat lineHViewH = sureBtn.bounds.size.height;
            UIView *lineHView = [[UIView alloc] initWithFrame:CGRectMake(lineHViewX, lineHViewY, lineHViewW, lineHViewH)];
            lineHView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];
            [self addSubview:lineHView];
        }
        // lineView
        CGFloat lineViewW = self.bounds.size.width;
        CGFloat lineViewH = 0.5;
        CGFloat lineViewX = sureBtn.frame.origin.x;
        CGFloat lineViewY = sureBtn.frame.origin.y - lineViewH;
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(lineViewX, lineViewY, lineViewW, lineViewH)];
        lineView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];
        [self addSubview:lineView];
        // titleLabel
        CGFloat titleLabelX = 15;
        CGFloat titleLabelY = 0;
        CGFloat titleLabelW = self.bounds.size.width - titleLabelX * 2;
        CGFloat titleLabelH = (lineView.frame.origin.y - 20) / 2.0;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH)];
        titleLabel.text = title;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        // messageLabel
        CGFloat messageLabelX = titleLabel.frame.origin.x;
        CGFloat messageLabelY = CGRectGetMaxY(titleLabel.frame);
        CGFloat messageLabelW = titleLabel.bounds.size.width;
        CGFloat messageLabelH = titleLabel.bounds.size.height;
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH)];
        messageLabel.text = message;
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.font = [UIFont systemFontOfSize:15];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.numberOfLines = 0;
        [self addSubview:messageLabel];
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
