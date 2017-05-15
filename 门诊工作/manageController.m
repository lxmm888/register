//
//  manageController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/10.
//  Copyright © 2017年 Xuan. All rights reserved.
///Users/lxmm/Library/Developer/CoreSimulator/Devices/6E016A6E-BB9D-43A3-B04D-4FBCAA51ACD5/data/Containers/Data/Application/F2704DE8-5F13-4601-B7E1-C63502712688/Documents

#import "manageCell.h"
#import "manageController.h"
#import "popMenu.h"
#import "manageCellView.h"

@interface manageController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation manageController{
    UITableView *tView;
    //传进来的字典，for in后转成模型，添加到dataSource
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
    tView.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:251/255.0 alpha:1.0];
    tView.tableFooterView = [UIView new];
    tView.delegate = self;
    tView.dataSource = self;
    tView.rowHeight = 260;
    tView.allowsSelection = NO;
    tView.separatorColor = [UIColor clearColor];
    [self.view addSubview:tView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:251/255.0 alpha:1.0];
    [self setNav];
    [self setTableView];


    
    // Do any additional setup after loading the view.
}

- (void)setNav
{
    UIButton *titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [titleBtn setTitle:@"病人信息" forState:UIControlStateNormal];
    self.navigationItem.titleView = titleBtn;
    [titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIImage *im = [UIImage imageNamed:@"navigationbar_more"];
    im = [im imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:im style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

- (void)initData
{
    dataSource = [NSMutableArray array];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *regPath = [documentsDirectory stringByAppendingPathComponent:@"regList.plist"];

    for (NSDictionary *dict in [NSArray arrayWithContentsOfFile:regPath]) {
        regPerson *rp = [regPerson dictToModel:dict];
        [dataSource addObject:rp];
    }
    
}

- (void)titleBtnClick
{
    popMenu *pm = [[popMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.height)];
    pm.isDim = YES;
    pm.dataSource = dataSource;
    [[UIApplication sharedApplication].keyWindow addSubview:pm];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    manageCell *cell = [manageCell tableViewToCell:tableView];
//    cell.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:251/255.0 alpha:1.0];
//    cell.rp = dataSource[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    manageCellView *mcv = [[manageCellView alloc] initWithFrame:CGRectMake(0, 0, LXScreenW, 260)];
//    cell.height = mcv.cellH;
    mcv.regPerson =dataSource[indexPath.row];
    mcv.centerX = self.view.centerX;
    [cell.contentView addSubview:mcv];
    return cell;
}

@end
