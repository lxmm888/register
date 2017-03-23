//
//  manageController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/10.
//  Copyright © 2017年 Xuan. All rights reserved.
//
#import "manageCell.h"
#import "manageController.h"

@interface manageController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation manageController{
    UITableView *tView;
    NSMutableArray *dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = [NSMutableArray array];
    [self setTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)setTableView
{
    tView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tView.delegate = self;
    tView.dataSource = self;
    [self.view addSubview:tView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    manageCell *cell = [manageCell tableViewToCell:tableView];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
