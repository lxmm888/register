//
//  regController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//  挂号页面控制器
#import "regCell.h"
#import "regController.h"
#import "noticeController.h"

@interface regController ()<UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate>

@end

@implementation regController{
    UITableView *tView;
//    noticeView *nView;
    UIView *fuzzyView;
    noticeController *nc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = _m.className;
    self.hidesBottomBarWhenPushed = YES;
    [self setTableView];
//    [self setNoticeView];
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
//    [[UIApplication sharedApplication].keyWindow addSubview:fuzzyView];

    __weak typeof (self) ws=self;
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] init];
    [gr addTarget:self action:@selector(grTap)];
//    [nc.view addGestureRecognizer:gr];
//    _nView = [[noticeView alloc] initWithFrame:CGRectMake(0, self.view.height, 330, 150)];
    _nView = [[noticeView alloc] initWithFrame:self.view.frame];
    _nView.backgroundColor = [UIColor blackColor];
    _nView.centerX = self.view.width * 0.5;
    _nView.regController = ws;
//    [self.view addSubview:nView];
    

//    _nView.btnBlock=^(id obj){
//        if ([obj isKindOfClass:[UIView class]]) {
////            [ws.navigationController pushViewController:obj animated:YES];
//            [UIView animateWithDuration:0.5 animations:^{
//                ((UIView *)obj).y = ws.view.height;
//                fuzzyView.alpha = 0;
//
//            }];
//        }
//    };
//    
//    [nView addGestureRecognizer:gr];
        [[UIApplication sharedApplication].keyWindow addSubview:_nView];
//    AlphaViewController *ac = [[AlphaViewController alloc] init];
//    [self.view addSubview:ac.view];
    
   
}

- (void)grTap
{
    [UIView animateWithDuration:0.5 animations:^{
//        nc.view.y = self.view.height;
        _nView.y = self.view.height;
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

    noticeView *nview = [[noticeView alloc] initWithFrame:self.view.frame];
    NSString *doctorName = _m.classDoctor[indexPath.row];
    nview.doctorName = doctorName;
    nview.isDim = YES;
    nview.userName = self.userName;
    nview.m = _m;
    [self.view addSubview:nview];
    
     __weak typeof (self) ws=self;
    
        
//        if ([obj isKindOfClass:[UIView class]]) {
//            //            [ws.navigationController pushViewController:obj animated:YES];
////            [UIView animateWithDuration:0.5 animations:^{
////                ((UIView *)obj).y = ws.view.height;
////                fuzzyView.alpha = 0;
////                
////            }];
//            [ws.navigationController popToRootViewControllerAnimated:YES];
        


    
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
