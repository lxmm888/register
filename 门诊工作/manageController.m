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
//    UITableView *__tView;
    NSMutableArray *dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = [NSMutableArray array];

    [self initData];
    [self setTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)initData
{
    NSString *p = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    NSString *path = [p stringByAppendingPathComponent:@"RegList.plist"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:path]) {
        return;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    dataSource = dict.allKeys;

}

- (void)setTableView
{
    _tView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tView.delegate = self;
    _tView.dataSource = self;
    _tView.allowsSelection = NO;
    [self.view addSubview:_tView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    manageCell *cell = [manageCell tableViewToCell:tableView];
    cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
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
