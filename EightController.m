//
//  EightController.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "EightController.h"
#import "LDHUDTool.h"

@interface EightController ()

@end

@implementation EightController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 80, 50);
    [btn setTitle:@"删除" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    [LDHUDTool showHUDWithText:@"确定要删除该商品吗?" sureBtnText:@"确定" cancalBtnText:@"取消" sureBtnCb:^{
        NSLog(@"点击确定");
    } cancalBtnCb:^{
        NSLog(@"点击取消");
    }];
}


@end
