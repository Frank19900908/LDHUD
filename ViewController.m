//
//  ViewController.m
//  LDAlert
//
//  Created by Frank on 17/6/20.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "ViewController.h"
#import "LDHUDTool.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark - 懒加载
// 1.数据源
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
// 2.tableView
- (UITableView *)tableView
{
    if (_tableView == nil) {
        // 初始化
        CGFloat tableViewX = 0;
        CGFloat tableViewY = 64;
        CGFloat tableViewW = self.view.bounds.size.width;
        CGFloat tableViewH = self.view.bounds.size.height - tableViewY;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH) style:UITableViewStylePlain];
        // 代理
        _tableView.dataSource = self;
        _tableView.delegate = self;
        // 注册
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width, 20)];
        footView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = footView;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
    [self initUI];
}

#pragma mark - 初始化数据
- (void)initData
{
    self.dataArray = [NSMutableArray arrayWithArray:@[@"一  OneController", @"二  TwoController", @"三  ThreeController", @"四  FourController", @"五  FiveController", @"六  SixController", @"七  SevenController", @"八  EightController"]];
}

#pragma mark - 初始化界面
- (void)initUI
{
    self.title = @"弹窗样式";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - 代理方法<UITableViewDataSource, UITableViewDelegate>
// 1.行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
// 2.Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
// 3.Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
// 4.点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSArray *array = @[@"OneController", @"TwoController", @"ThreeController", @"FourController", @"FiveController", @"SixController", @"SevenController", @"EightController"];
    UIViewController *vc = [[NSClassFromString(array[indexPath.row]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
