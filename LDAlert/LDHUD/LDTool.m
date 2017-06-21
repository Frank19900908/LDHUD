//
//  LDTool.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "LDTool.h"

@implementation LDTool

#pragma mark -- 根据文本计算文本框尺寸
+ (CGSize)widthOfText:(NSString *)text font:(UIFont *)textFont maxSize:(CGSize)maxSize
{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:textFont} context:nil].size;
}

@end
