//
//  meController.m
//  门诊工作
//
//  Created by lxmm on 17/4/20.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "meController.h"

@interface meController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tView;
    NSMutableArray *dataSource;
}

@end

@implementation meController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self initData];
    [self setTableView];
    // Do any additional setup after loading the view.
}
- (void)initData
{
    dataSource = [NSMutableArray array];
    
    NSDictionary *dict0 = [NSDictionary dictionaryWithObject:@"积分" forKey:@"0"];
    NSArray *arr0 = [NSArray arrayWithObject:dict0];
    [dataSource addObject:arr0];
    
    NSDictionary *dict10 = [NSDictionary dictionaryWithObject:@"name" forKey:@"0"];
    NSDictionary *dict11 = [NSDictionary dictionaryWithObject:@"tel" forKey:@"1"];
    NSArray *arr1 = [NSArray arrayWithObjects:dict10,dict11, nil];
    
    [dataSource addObject:arr1];

    
}

- (void)setTableView
{
    tView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tView.dataSource = self;
    tView.delegate = self;
    [self.view addSubview:tView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = dataSource[section];
    return arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    NSArray *arr = dataSource[indexPath.section];
    NSDictionary *dict = arr[indexPath.row];
    cell.textLabel.text = [dict valueForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
//    cell.detailTextLabel.text = []
//    dataSource[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:vc animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
