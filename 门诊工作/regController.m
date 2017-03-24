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
#import "AlphaViewController.h"

@interface regController ()<UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate>

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
    self.hidesBottomBarWhenPushed = YES;
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
//    毛玻璃效果
    fuzzyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, [UIScreen mainScreen].bounds.size.height)];
    fuzzyView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
//    fuzzyView.hidden = YES;
    fuzzyView.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:fuzzyView];
//
//    
//    fuzzyView=[[UIVisualEffectView alloc]initWithFrame:self.view.bounds];
//    fuzzyView.effect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    fuzzyView.alpha = 0;
//    [[UIApplication sharedApplication].keyWindow addSubview:fuzzyView];
    
//    [self.view addSubview:fuzzyView];
//    nc = [[noticeController alloc] init];
//    nc.view.frame = self.view.bounds;
//    nc.view.centerX = self.view.width * 0.5;
//    [[UIApplication sharedApplication].keyWindow addSubview:nc.view];

//    [fuzzyView addSubview:nc.view];
    
//    [self presentViewController:nc animated:YES completion:^{
//        
//    }];

    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] init];
    [gr addTarget:self action:@selector(grTap)];
//    [nc.view addGestureRecognizer:gr];
    nView = [[noticeView alloc] initWithFrame:CGRectMake(0, self.view.height, 330, 150)];
    nView.backgroundColor = [UIColor blackColor];
    nView.centerX = self.view.width * 0.5;
    nView.regController = self;
    __weak typeof (self) ws=self;

    nView.btnBlock=^(id obj){
        if ([obj isKindOfClass:[UIView class]]) {
//            [ws.navigationController pushViewController:obj animated:YES];
            [UIView animateWithDuration:0.5 animations:^{
                ((UIView *)obj).y = ws.view.height;
                fuzzyView.alpha = 0;

            }];
        }
    };
    
//    [nView addGestureRecognizer:gr];
        [[UIApplication sharedApplication].keyWindow addSubview:nView];
    AlphaViewController *ac = [[AlphaViewController alloc] init];
    [self.view addSubview:ac.view];
    
   
}

- (void)grTap
{
    [UIView animateWithDuration:0.5 animations:^{
//        nc.view.y = self.view.height;
        nView.y = self.view.height;
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
//    [self presentViewController:[[AlphaViewController alloc]init] animated:YES completion:nil];
//    return;
    [UIView animateWithDuration:0.5 animations:^{
//        nc.view.centerY = self.view.centerY;
        nView.m = _m;
        nView.centerY = self.view.centerY;
        fuzzyView.alpha = 1;
//        nView.alpha = 1.0;
//        fuzzyView.hidden = NO;
    }];
//    [self popAMenu];
}

-(void)popAMenu
{
    UINavigationController* nav=[[UINavigationController alloc]initWithRootViewController:[[UITableViewController alloc]initWithStyle:UITableViewStylePlain]];
    nav.modalPresentationStyle=UIModalPresentationPopover;
    nav.preferredContentSize=CGSizeMake(200, 200);
    
    UIView* vi=[[UIView alloc]init];
    
    UIPopoverPresentationController* pop=nav.popoverPresentationController;
    pop.delegate=self;
//    pop.sourceView=vi;
    pop.sourceRect=vi.bounds;
//    pop.v
    
    [self presentViewController:nav animated:YES completion:nil];
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
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
