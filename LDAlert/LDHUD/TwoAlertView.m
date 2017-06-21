//
//  TwoAlertView.m
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "TwoAlertView.h"

@implementation TwoAlertView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame icon:(NSString *)iconName text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        BOOL isIcon = iconName == nil ? NO : YES;
        // textLabel
        CGFloat textLabelW = self.bounds.size.width;
        CGFloat textLabelH = isIcon ? (self.bounds.size.height - 20) / 3.0 : self.bounds.size.height;
        CGFloat textLabelX = 0;
        CGFloat textLabelY = isIcon ? self.bounds.size.height - textLabelH - 20 : self.bounds.size.height - textLabelH;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)];
        textLabel.text = text;
        textLabel.textColor = [UIColor whiteColor];
        textLabel.font = [UIFont systemFontOfSize:16];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        if (isIcon) {
            // iconImageView
            UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
            iconImageView.center = CGPointMake(self.bounds.size.width / 2.0, textLabel.frame.origin.y / 2.0 + 10);
            [self addSubview:iconImageView];
        }
    }
    return self;
}

@end
