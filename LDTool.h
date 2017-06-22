//
//  LDTool.h
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LDTool : NSObject

#pragma mark - 根据文本计算文本框尺寸
+ (CGSize)widthOfText:(NSString *)text font:(UIFont *)textFont maxSize:(CGSize)maxSize;

@end
