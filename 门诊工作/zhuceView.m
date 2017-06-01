//
//  regView.m
//  login
//
//  Created by lxmm on 17/4/24.
//  Copyright © 2017年 lxmm. All rights reserved.
//  弹出alertController。 注册成功后要清空所有textField。判断用户是否存在

#import "zhuceView.h"

@interface zhuceView()<UITextFieldDelegate>

@end

@implementation zhuceView{
    UITextField *nameTF;
    UITextField *telTF;
    UITextField *passwd;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat labelX = 70;
        CGFloat labelY = 150;
        CGFloat labelW = 40;
        CGFloat labelH = 44;
        
        //    CGFloat fieldX = CGRectGetMaxX(accountLabel.frame) + 30;
        CGFloat fieldY = labelY;
        CGFloat fieldW = 300;
        CGFloat fieldH = labelH;
        
        nameTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, fieldW, fieldH)];
        nameTF.center = CGPointMake(self.bounds.size.width * 0.5, 50);
        nameTF.placeholder = @"请设置昵称";
        //    [accountTF setFrame:CGRectMake(fieldX,fieldY, fieldW, fieldH)];
        nameTF.borderStyle = UITextBorderStyleRoundedRect;
        nameTF.delegate = self;
        [self addSubview:nameTF];
        
        telTF = [[UITextField alloc] init];
        telTF.placeholder = @"请输入手机号";
        [telTF setFrame:CGRectMake(nameTF.frame.origin.x, CGRectGetMaxY(nameTF.frame) + 10, fieldW, fieldH)];
        telTF.borderStyle = UITextBorderStyleRoundedRect;
        telTF.delegate = self;
        [self addSubview:telTF];
        
        passwd = [[UITextField alloc] init];
        passwd.placeholder = @"请设置6~12位密码";
        [passwd setFrame:CGRectMake(nameTF.frame.origin.x, CGRectGetMaxY(telTF.frame) + 10, fieldW, fieldH)];
        passwd.borderStyle = UITextBorderStyleRoundedRect;
        passwd.delegate = self;
        passwd.rightViewMode = UITextFieldViewModeWhileEditing;
        passwd.secureTextEntry = YES;
        [self addSubview:passwd];
        
        UIButton *regBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        regBtn.center = CGPointMake(self.bounds.size.width * 0.5, CGRectGetMaxY(passwd.frame) + 50);
        //    [loginBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
        [regBtn setBackgroundColor:[UIColor colorWithRed:71/255.0 green:191/255.0 blue:58/255.0 alpha:1.0]];
        [regBtn setTitle:@"注册" forState:UIControlStateNormal];
        regBtn.layer.cornerRadius = 5.0;
        [regBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        //点击登录按钮跳转
        [regBtn addTarget:self action:@selector(regBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:regBtn];


    }
    return self;
}

- (void)regBtnClick
{
    if (nameTF.text.length == 0 || telTF.text.length== 0 || passwd.text.length == 0) {
        NSLog(@"有空");
    }
    else{
    NSDictionary *userDict = [NSDictionary dictionaryWithObjectsAndKeys:nameTF.text,@"name",telTF.text,@"account",passwd.text,@"passwd", nil];
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:userDict forKey:telTF.text];
    NSLog(@"注册成功");
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
