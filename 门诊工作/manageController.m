//
//  manageController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/10.
//  Copyright © 2017年 Xuan. All rights reserved.
//
#import "manageCell.h"
#import "manageController.h"
#import "popMenu.h"

@interface manageController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation manageController{
    UITableView *tView;
    NSMutableArray *dataSource;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initData];
    if (tView != nil) {
        [tView reloadData];
    }
}

- (void)setTableView
{
    tView = [UITableView new];
    tView.frame = self.view.bounds;
    tView.delegate = self;
    tView.dataSource = self;
    [self.view addSubview:tView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];

    dataSource = [NSMutableArray array];

//    [self setTableView];
//    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [titleBtn setTitle:@"点击弹出" forState:UIControlStateNormal];
    self.navigationItem.titleView = titleBtn;
    [titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)initData
{
    NSString *p = @"/Users/lxmm/Desktop/lxmm/门诊工作/门诊工作";
    
    
    NSString *path = [p stringByAppendingPathComponent:@"RegList.plist"];
//    [dataSource addObject:[NSArray arrayWithContentsOfFile:path]];
    dataSource = [NSArray arrayWithContentsOfFile:path];
//    [dataSource addObject:[NSDictionary dictionaryWithContentsOfFile:path]];
    NSLog(@"%d",dataSource.count);
    
}

- (void)titleBtnClick
{
    popMenu *pm = [[popMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.height)];
    pm.isDim = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:pm];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
//    cell.textLabel.text =
    NSDictionary *dict = dataSource[indexPath.row];
    cell.textLabel.text = [dict.allKeys firstObject];
    cell.detailTextLabel.text = [dict.allValues firstObject];
    return cell;
}

@end
