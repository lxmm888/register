//
//  loginController.m
//  Attendence
//
//  Created by lxmm on 17/1/15.
//  Copyright © 2017年 iMac206. All rights reserved.
//
#import "LXSegment.h"
#import "loginController.h"
#import "loginView.h"
#import "tab.h"
#import "zhuceView.h"
@interface loginController ()<UITextFieldDelegate>

@end

@implementation loginController{
    UIButton *confirmBtn;
    int i;//设置获取验证码间隔
}

- (void)viewDidLoad {
    [super viewDidLoad];
    i = 5;
    self.view.backgroundColor = [UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1];
    [self setSubviews];
    // Do any additional setup after loading the view.
}

- (void)setSubviews
{
    //创建两个label，两个textField
    CGFloat labelX = 70;
    CGFloat labelY = 150;
    CGFloat labelW = 40;
    CGFloat labelH = 44;
    
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    titleLabel.center = CGPointMake(self.view.bounds.size.width * 0.5, 100);
    titleLabel.text = @"预约系统";
    titleLabel.font = [UIFont systemFontOfSize:25];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:titleLabel];

 
    
    LXSegment *seg = [[LXSegment alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame) + 20, self.view.bounds.size.width, 44)];
  
    [self.view addSubview:seg];
      CGRect choosenRect = CGRectMake(0, CGRectGetMaxY(seg.frame), self.view.width, self.view.height - CGRectGetMaxY(seg.frame));
    loginView *lv = [[loginView alloc] initWithFrame:choosenRect];
    [self.view addSubview:lv];
    zhuceView *rv = [[zhuceView alloc] initWithFrame:choosenRect];
    [self.view addSubview:rv];
    rv.hidden = !lv.hidden;
    NSDictionary *dic1 = [NSDictionary dictionaryWithObject:lv forKey:@"登录"];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObject:rv forKey:@"注册"];
    NSArray *arr = @[dic1,dic2];
    [seg addViewAndTitleWithArray:arr];
    
    CGFloat fieldY = labelY;
    CGFloat fieldW = 300;
    CGFloat fieldH = labelH;
    
    UITextField *accountTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, fieldW, fieldH)];
    accountTF.center = CGPointMake(self.view.bounds.size.width * 0.5, CGRectGetMaxY(seg.frame) + 50);
    accountTF.placeholder = @"账户";
//    [accountTF setFrame:CGRectMake(fieldX,fieldY, fieldW, fieldH)];
    accountTF.borderStyle = UITextBorderStyleRoundedRect;
    accountTF.delegate = self;
//    [self.view addSubview:accountTF];
    
    
    UITextField *passwd = [[UITextField alloc] init];
    passwd.placeholder = @"密码";
    [passwd setFrame:CGRectMake(accountTF.frame.origin.x, CGRectGetMaxY(accountTF.frame) + 10, fieldW, fieldH)];
    passwd.borderStyle = UITextBorderStyleRoundedRect;
    passwd.delegate = self;
//    [self.view addSubview:passwd];
    
    //设置登录按钮及背景色
//    UIImage *image = [UIImage imageNamed:@"RedButton"];
//    UIImage *bgImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    CGFloat y = CGRectGetMaxY(passwd.frame) + 50;//CGRectGetMaxY(im.frame) + 30;
    CGFloat x = 20;
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    loginBtn.center = CGPointMake(self.view.bounds.size.width * 0.5, CGRectGetMaxY(passwd.frame) + 50);
//    [loginBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor colorWithRed:71/255.0 green:191/255.0 blue:58/255.0 alpha:1.0]];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 5.0;
    [loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    
    
    confirmBtn = [[UIButton alloc] init];
    [confirmBtn setFrame:CGRectMake(self.view.bounds.size.width - 150, CGRectGetMaxY(loginBtn.frame) + 30, 100, 50)];
//    [confirmBtn setBackgroundColor:[UIColor greenColor]];
    confirmBtn.layer.cornerRadius = 5.0;
    [confirmBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:confirmBtn];
    
    UIButton *regBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 150, CGRectGetMaxY(loginBtn.frame) + 30, 100, 50)];
    [regBtn setTitle:@"注册" forState:UIControlStateNormal];
    [regBtn addTarget:self action:@selector(regBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:regBtn];


}

- (void)regBtnClick
{
    
}

//- (void)confirmBtnClick
//{
//    NSLog(@"confirmBtnisClicking");
//    [confirmBtn setEnabled:NO];
//    
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFired:) userInfo:nil repeats:YES];
//    
//}
//
//- (void)timeFired:(NSTimer *)timer
//{
//    [confirmBtn setTitle:[NSString stringWithFormat:@"重新获取(%d)",i] forState:UIControlStateNormal];
//    i --;
//    if (i < 0) {
//        [timer invalidate];
//        [confirmBtn setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
//        i = 5;
//        [confirmBtn setEnabled:YES];
//    }
//}

- (void)loginBtnClick
{
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
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
