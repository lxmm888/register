//
//  AlphaViewController.m
//  门诊工作
//
//  Created by lxmm on 17/3/11.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "AlphaViewController.h"

@interface AlphaViewController ()

@end

@implementation AlphaViewController

-(instancetype)init{
    self=[super init];
    self.modalPresentationStyle=UIModalPresentationPopover;
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    
    
    UIView* vi=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    vi.backgroundColor=[UIColor redColor];
    [self.view addSubview:vi];
    // Do any additional setup after loading the view.
    
    UINavigationController* nav=[[UINavigationController alloc]init];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
