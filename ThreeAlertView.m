//
//  ThreeAlertView.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "ThreeAlertView.h"

@implementation ThreeAlertView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        // textLabel
        CGFloat textLabelW = self.bounds.size.width;
        CGFloat textLabelH = (self.bounds.size.height - 20) / 3.0;
        CGFloat textLabelX = 0;
        CGFloat textLabelY = self.bounds.size.height - textLabelH - 20;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)];
        textLabel.text = text;
        textLabel.textColor = [UIColor whiteColor];
        textLabel.font = [UIFont systemFontOfSize:16];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        // indicatorView
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicatorView.center = CGPointMake(self.bounds.size.width / 2.0, textLabel.frame.origin.y / 2.0 + 10);
        indicatorView.tag = 100;
        [self addSubview:indicatorView];
        [indicatorView startAnimating];
    }
    return self;
}

#pragma mark - 停止菊花动画
- (void)stopIndicatorViewAnimation
{
    UIActivityIndicatorView *indicatorView = [self viewWithTag:100];
    [indicatorView stopAnimating];
}

@end
