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
#import "LXBorder.h"
@interface homeController ()

@end

@implementation homeController{
    UIView *choosenView;
    regView *rView;
    desView* lView;
    CGRect choosenRect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    self.title = @"挂号";
//    self.hidesBottomBarWhenPushed = YES;
    CGFloat topViewH = 60;
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, topViewH)];
    topView.backgroundColor = [UIColor whiteColor];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    iconView.frame = CGRectMake(20, 20, 44, 44);
    iconView.center = CGPointMake(40, topView.height * 0.5);
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 22;
    [topView addSubview:iconView];
    [self.view addSubview:topView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame) + 20, CGRectGetMinY(iconView.frame) + 3, 200, 20)];
    label.text = @"K322全科医院";
    label.font = [UIFont systemFontOfSize:16];
    [topView addSubview:label];
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.x, CGRectGetMaxY(label.frame), 100, 20)];
    detailLabel.text = @"三级丙等";
    detailLabel.textColor = [UIColor lightGrayColor];
    [detailLabel setFont:[UIFont systemFontOfSize:12]];
    [topView addSubview:detailLabel];
    
    LXBorder *border1 = [[LXBorder alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), self.view.width, 10)];

    [self.view addSubview:border1];
    
    
    
    LXSegment *seg = [[LXSegment alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(border1.frame), self.view.width, 44)];
    choosenRect = CGRectMake(0, CGRectGetMaxY(seg.frame), self.view.width, self.view.height - 44 - CGRectGetMaxY(seg.frame));
    
    rView = [[regView alloc] initWithFrame:choosenRect];
    __weak typeof (self) ws=self;
    rView.btnBlock=^(id obj){
        if ([obj isKindOfClass:[UIViewController class]]) {
            [ws.navigationController pushViewController:obj animated:YES];
        }
    };
    [self.view addSubview:rView];
    
    lView=[[desView alloc]initWithFrame:rView.frame];
    lView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:lView];
    lView.hidden=!rView.hidden;

    NSDictionary *dic1 = [NSDictionary dictionaryWithObject:rView forKey:@"预约挂号"];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObject:lView forKey:@"医院简介"];
    NSArray *arr = @[dic1,dic2];
    [seg addViewAndTitleWithArray:arr];
    [self.view addSubview:seg];
    
    LXBorder *border2 = [[LXBorder alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(seg.frame), self.view.width, 2)];
    [self.view addSubview:border2];

}



- (void)setNav
{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    self.navigationItem.title = @"李氏中医精神病院";
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:dic];
    //    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
//    [self.navigationItem.backBarButtonItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
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
