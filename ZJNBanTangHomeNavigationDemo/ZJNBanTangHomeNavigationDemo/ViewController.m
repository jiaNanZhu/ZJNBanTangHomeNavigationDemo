//
//  ViewController.m
//  ZJNBanTangHomeNavigationDemo
//
//  Created by 朱佳男 on 2017/1/10.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "ZJNHeaderView.h"

#define SCREEN_HEIGHT                      [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH                       [UIScreen mainScreen].bounds.size.width
#define SCALE_6                                                   (SCREEN_WIDTH / 375)

@interface ViewController ()<UITableViewDelegate ,UITableViewDataSource>
@property (nonatomic ,strong)ZJNHeaderView *headerView;
@property (nonatomic ,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    UIView *tabelHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    tabelHeaderView.backgroundColor = [UIColor yellowColor];
    _tableView.tableHeaderView = tabelHeaderView;
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(200, 0, 0, 0);
    [self.view addSubview:_tableView];
    
    _headerView = [[ZJNHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self.headerView.tableView = self.tableView;
    _headerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_headerView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.backgroundColor = [UIColor darkGrayColor];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
