//
//  loginView.m
//  login
//
//  Created by lxmm on 17/4/24.
//  Copyright © 2017年 lxmm. All rights reserved.
//

#import "loginView.h"
#import "tab.h"

@interface loginView()<UITextFieldDelegate>

@end

@implementation loginView{
    UITextField *passwd;
    UITextField *accountTF;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建两个label，两个textField
        CGFloat labelX = 70;
        CGFloat labelY = 150;
        CGFloat labelW = 40;
        CGFloat labelH = 44;

        //    CGFloat fieldX = CGRectGetMaxX(accountLabel.frame) + 30;
        CGFloat fieldY = labelY;
        CGFloat fieldW = 300;
        CGFloat fieldH = labelH;
        
        accountTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, fieldW, fieldH)];
        accountTF.center = CGPointMake(self.bounds.size.width * 0.5, 50);
        accountTF.placeholder = @"账户";
        //    [accountTF setFrame:CGRectMake(fieldX,fieldY, fieldW, fieldH)];
        accountTF.borderStyle = UITextBorderStyleRoundedRect;
        accountTF.delegate = self;
        [self addSubview:accountTF];
        
        
        passwd = [[UITextField alloc] init];
        passwd.placeholder = @"密码";
        [passwd setFrame:CGRectMake(accountTF.frame.origin.x, CGRectGetMaxY(accountTF.frame) + 10, fieldW, fieldH)];
        passwd.borderStyle = UITextBorderStyleRoundedRect;
        passwd.delegate = self;
        passwd.secureTextEntry = YES;
        [self addSubview:passwd];
        
        //设置登录按钮及背景色
        //    UIImage *image = [UIImage imageNamed:@"RedButton"];
        //    UIImage *bgImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        CGFloat y = CGRectGetMaxY(passwd.frame) + 50;//CGRectGetMaxY(im.frame) + 30;
        CGFloat x = 20;
        UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        loginBtn.center = CGPointMake(self.bounds.size.width * 0.5, CGRectGetMaxY(passwd.frame) + 50);
        //    [loginBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
        [loginBtn setBackgroundColor:[UIColor orangeColor]];//[UIColor colorWithRed:71/255.0 green:191/255.0 blue:58/255.0 alpha:1.0]];
        [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        loginBtn.layer.cornerRadius = 5.0;
        [loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        //点击登录按钮跳转
        [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loginBtn];

    }
    return self;
}

- (void)loginBtnClick
{
    /** 注销所有响应者*/
    [self endEditing:YES];
    //判断是否为空
    if (accountTF.text.length == 0 || passwd.text.length == 0) {
        NSLog(@"账号密码不能为空");
        [self alertControllerNotice:@"账号密码不能为空，请重新输入"];
        return;
    }
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSDictionary *userDict = [defaults objectForKey:accountTF.text];
    if (userDict == nil) {
        //用户不存在
        NSLog(@"不存在此用户");
        [self alertControllerNotice:@"用户不存在"];
    }
    else{
        //存在 则判断账号密码是否一致
        if ([[userDict valueForKey:@"passwd"] isEqualToString:passwd.text]) {
            //密码正确
            NSLog(@"密码正确");
            tab *t = [[tab alloc] init];
            t.account = accountTF.text;
            t.name = [userDict valueForKey:@"name"];
            
            [UIView animateWithDuration:0.5 animations:^{
                [UIApplication sharedApplication].keyWindow.rootViewController = t;
            }];
        }
        else{
            NSLog(@"密码错误");
            [self alertControllerNotice:@"密码错误"];
        }
    }
}

- (void)alertControllerNotice:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirmAction];
    [[UIApplication sharedApplication].windows[0].rootViewController presentViewController:alert animated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self endEditing:YES];
    return YES;
}

@end
