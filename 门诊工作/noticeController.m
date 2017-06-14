//
//  noticeController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "noticeController.h"

@interface noticeController ()

@end

@implementation noticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *topBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.centerX, self.view.height, 200, 100)];
    NSLog(@"width%f",self.view.frame.size.width);
    NSLog(@"hei%f",self.view.frame.size.height);

    topBtn.backgroundColor = [UIColor orangeColor];
    [topBtn setTitle:@"挂号" forState:UIControlStateNormal];
    topBtn.titleLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:topBtn];
    
    //圆角
    self.view.layer.cornerRadius = 10;
    
    // Do any additional setup after loading the view.
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
