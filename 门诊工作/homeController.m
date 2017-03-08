//
//  homeController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/6.
//  Copyright © 2017年 Xuan. All rights reserved.
//
#import "regView.h"
#import "homeController.h"//
#import "LXSegment.h"
#import "desView.h"
@interface homeController ()

@end

@implementation homeController{
    UIView *choosenView;
    regView *rView;
    UIView* lView;
    CGRect choosenRect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"挂号";
    self.navigationItem.title = @"李氏中医精神病院";
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
    CGFloat topViewH = 60;
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, topViewH)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), self.view.width, 10)];
    border.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:border];
    
    
    
    LXSegment *seg = [[LXSegment alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(border.frame), self.view.width, 44)];
    choosenRect = CGRectMake(0, CGRectGetMaxY(seg.frame), self.view.width, self.view.height - 44 - CGRectGetMaxY(seg.frame));
    
    rView = [[regView alloc] initWithFrame:choosenRect];
    [self.view addSubview:rView];
    
    lView=[[UIView alloc]initWithFrame:rView.frame];
    lView.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:lView];
    lView.hidden=!rView.hidden;

    NSDictionary *dic1 = [NSDictionary dictionaryWithObject:rView forKey:@"预约挂号"];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObject:lView forKey:@"医院简介"];
    NSArray *arr = @[dic1,dic2];
    [seg addViewAndTitleWithArray:arr];
    [self.view addSubview:seg];
    
//    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"预约挂号",@"医院简介"]];
//    seg.frame = CGRectMake(0, CGRectGetMaxY(border.frame), self.view.width, 44);
////    seg.backgroundColor = [UIColor whiteColor];
////    seg.tintColor=[UIColor magentaColor];
//    [seg setSelectedSegmentIndex:0];
//    [seg addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:seg];
    
    
    
    
    
    
//    UIView *segView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(border.frame), self.view.width, 44)];
//    segView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:segView];
//    CGFloat viewCenterX = self.view.width * 0.5;
////    CGFloat viewCenterY = 0.5 * (CGRectGetMaxX(segView.frame) - CGRectGetMaxY(border.frame));
//    CGFloat viewCenterY = segView.height * 0.5;
//    UIButton *regBtn = [UIButton new];
//    [regBtn setTitle:@"预约挂号" forState:UIControlStateNormal];
//    [regBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    regBtn.center = CGPointMake(0.5 * viewCenterX, viewCenterY);
//    regBtn.size = CGSizeMake(100, 30);
//    [segView addSubview:regBtn];
//    
//    UIButton *introBtn = [UIButton new];
//    [introBtn setTitle:@"医院简介" forState:UIControlStateNormal];
//    [introBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    introBtn.center = CGPointMake(1.5 * viewCenterX, viewCenterY);
//    introBtn.size = CGSizeMake(100, 30);
//    [segView addSubview:introBtn];
    // Do any additional setup after loading the view.
}

- (void)segAction:(UISegmentedControl *)seg
{
//    choosenView = nil;
////    choosenView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(seg.frame), self.view.width, self.view.height - 44 - CGRectGetMaxY(seg.frame))];
////    [self.view addSubview:choosenView];
//    choosenView.frame = choosenRect;
    
//    UIView *vi = [[UIView alloc] initWithFrame:choosenRect];
//    vi.backgroundColor = [UIColor redColor];
    NSInteger index = seg.selectedSegmentIndex;
//    switch (index) {
//        case 0:
////            choosenView = rView;
//            
//            break;
//            
//        case 1:
////            choosenView = vi;
////            UIView *vi = [[UIView alloc] init];
//            break;
//            
//        default:
//            break;
//    }
//    if (choosenView) {
//        [self.view bringSubviewToFront:choosenView];
//    }
    BOOL hi=(index==1);
    rView.hidden=hi;
    lView.hidden=!rView.hidden;
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
