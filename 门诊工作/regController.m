//
//  regController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//  挂号页面控制器
#import "regCell.h"
#import "regController.h"
#import "noticeView.h"
#import "noticeController.h"

@interface regController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation regController{
    UITableView *tView;
    noticeView *nView;
    UIView *fuzzyView;
    noticeController *nc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = _m.className;

    [self setTableView];
    [self setNoticeView];
    // Do any additional setup after loading the view.
}

- (void)setTableView
{
    tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    tView.dataSource = self;
    tView.delegate = self;
    [self.view addSubview:tView];
    UIView *whiteView = [UIView new];
    tView.tableFooterView = whiteView;
    tView.rowHeight = 55;
}

- (void)setNoticeView
{
    
    fuzzyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, [UIScreen mainScreen].bounds.size.height)];
    fuzzyView.backgroundColor = [UIColor lightGrayColor];
//    fuzzyView.hidden = YES;
    fuzzyView.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:fuzzyView];
    
    nc = [[noticeController alloc] init];
    nc.view.frame = CGRectMake(0, self.view.height, 300, 100);
    nc.view.centerX = self.view.width * 0.5;
    [fuzzyView addSubview:nc.view];
//    [self presentViewController:nc animated:YES completion:^{
//        
//    }];

    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] init];
    [gr addTarget:self action:@selector(grTap)];
    nView = [[noticeView alloc] initWithFrame:CGRectMake(0, self.view.height, 300, 140)];
    nView.backgroundColor = [UIColor magentaColor];
    nView.centerX = self.view.width * 0.5; 
    [nView addGestureRecognizer:gr];
//    [fuzzyView addSubview:nView];
    
   
}

- (void)grTap
{
    [UIView animateWithDuration:0.5 animations:^{
        nc.view.y = self.view.height;
        fuzzyView.alpha = 0;
    } completion:^(BOOL finished) {
//        fuzzyView.hidden = YES;

    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _m.classDoctor.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    regCell *cell = [regCell tableViewToCell:tableView];
    cell.doctorName = _m.classDoctor[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:0.5 animations:^{
        nc.view.centerY = self.view.centerY;
        fuzzyView.alpha = 0.6;
//        fuzzyView.hidden = NO;
    }];
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
