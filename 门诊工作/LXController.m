//
//  LXController.m
//  门诊工作
//
//  Created by Xuan on 2017/6/15.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "LXController.h"

@interface LXController ()<UITableViewDataSource>

@end

@implementation LXController{
    UITableView *tView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
    self.view.backgroundColor = [UIColor blueColor];
    
    tView.frame = self.view.frame;
    tView.dataSource = self;
    [self.view addSubview:tView];
    // Do any additional setup after loading the view.
}

- (void)setDataSource:(NSMutableArray *)dataSource
{
    _dataSource = dataSource;
    [tView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dataSource.count == 0) {
        return nil;
    }
    else{
        return nil;
    }
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
