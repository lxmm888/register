
//
//  noticeView.m
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
// 症状描述 预约时间

#import "noticeView.h"
#import "manageController.h"
#import "regPerson.h"
#import "tab.h"
#import "manageController.h"
#import "LXDatePickerView.h"
@interface noticeView()<UITextFieldDelegate>

@end

@implementation noticeView{
    UIButton *cover;
    UIView *containView;
    UIDatePicker *datePicker;
    UILabel *doctorNameLabel;
    CGFloat cellH;
    NSMutableDictionary *nameDict;
    NSMutableDictionary *telDict;
    NSString *nameStr;
    NSString *telStr;
    LXDatePickerView *datePickerView;
  
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setCover];
        [self setContainView];
//        [self setViews];
        
    }
    return self;
}

- (void)setCover
{
    cover = [[UIButton alloc] initWithFrame:self.frame];
    cover.backgroundColor = [UIColor clearColor];
//    cover.alpha = 0.3;
    [self addSubview:cover];
    [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)coverClick
{
//    cover.backgroundColor = [UIColor clearColor];
}

- (void)setContainView
{
    nameDict = [NSMutableDictionary dictionary];
    telDict = [NSMutableDictionary dictionary];
    
    containView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, 330, 400)];
    containView.backgroundColor = [UIColor whiteColor];
    containView.centerX = self.centerX;
    [self addSubview:containView];
    CGFloat topViewH = 35;
    
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, containView.width, topViewH)];
    topView.backgroundColor = [UIColor orangeColor];
    [containView addSubview:topView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    //    title.backgroundColor = [UIColor lightGrayColor];
    title.centerX = topView.centerX;
    title.centerY = topView.centerY;
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"详情";
    title.textColor = [UIColor whiteColor];
    [topView addSubview:title];
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 20, 20)];
    closeBtn.centerY = topView.centerY;
    [closeBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:closeBtn];
    
    //中间内容：医生头像、姓名，资历，职称，诊金
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"医生"]];
    iconView.frame = CGRectMake(10, CGRectGetMaxY(topView.frame) + 10, 50, 50);
    [containView addSubview:iconView];
    
    doctorNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame) + 20,  iconView.y, 100, iconView.height * 0.5)];
    doctorNameLabel.textColor = [UIColor grayColor];
    [containView addSubview:doctorNameLabel];
    
    UILabel *levelLabel = [[UILabel alloc] initWithFrame:doctorNameLabel.frame];
    levelLabel.y = CGRectGetMaxY(doctorNameLabel.frame);
    levelLabel.textColor = [UIColor grayColor];
    levelLabel.text = @"职称：主任";
    [containView addSubview:levelLabel];
    
    UILabel *noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(iconView.frame) + 25, 200, 20)];
    noticeLabel.text = @"请选择预约时间：";
    noticeLabel.textColor = [UIColor grayColor];
    [containView addSubview:noticeLabel];
    
    
    datePickerView = [[LXDatePickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(noticeLabel.frame) + 10, containView.width, 200)];
    
    [containView addSubview:datePickerView];
    
    CGFloat bottomY = containView.height - topViewH;
    
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, bottomY, containView.width, topViewH)];
    [bottomBtn setBackgroundColor:[UIColor orangeColor]];
    [bottomBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [containView addSubview:bottomBtn];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    containView.layer.cornerRadius = 8;
    containView.clipsToBounds=YES;
    
}

-(void)setDoctorName:(NSString *)doctorName
{
    _doctorName = doctorName;
    doctorNameLabel.text = self.doctorName;
}

- (void)setIsDim:(BOOL)isDim
{
    _isDim = isDim;
    [UIView animateWithDuration:0.5 animations:^{
        if (_isDim) {
            cover.backgroundColor = [UIColor blackColor];
            cover.alpha = 0.3;
            containView.centerY = self.centerY;
        }else{
            cover.backgroundColor = [UIColor clearColor];
            cover.alpha = 1.0;
            containView.y = self.height;

            //
            
        }
    } completion:^(BOOL finished) {
        if (_isDim == NO) {
            [self removeFromSuperview];
            
        }
    }];

    
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 0) {
        [nameDict setValue:textField.text forKey:@"name"];
        nameStr = textField.text;
    }
    else{
        [telDict setValue:textField.text forKey:@"tel"];
        telStr = textField.text;
    }
    
    NSLog(@"name:%@",nameStr);
    NSLog(@"tel:%@",telStr);

}

- (void)closeBtnClick
{

    [UIView animateWithDuration:0.5 animations:^{
        self.isDim = NO;
        
    }];
  
}



- (void)bottomBtnClick
{
    [self endEditing:YES];
    NSString *orderTime = [datePickerView getTitle];
    NSString *noticeMessage = [NSString stringWithFormat:@"预约科室：%@\n预约医生：%@\n预约时间：%@",self.m.departName,self.doctorName,orderTime];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请确认您的预约信息" message:noticeMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
        //用[NSDate date]可以获取系统当前时间
        NSString *regTime = [dateFormatter stringFromDate:[NSDate date]];
      
        NSDictionary *orderDict = [NSDictionary dictionaryWithObjectsAndKeys:_m.className,@"className",_doctorName,@"doctorName",self.account,@"telStr",_m.departName,@"departName",self.name,@"nameStr",regTime,@"regTime",orderTime,@"orderTime",nil];
        
        
        NSFileManager *fm = [NSFileManager defaultManager];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        //    NSLog(@"app_home_doc: %@",documentsDirectory);
        
        NSString *regPath = [documentsDirectory stringByAppendingPathComponent:@"regList.plist"];
        NSLog(@"%@",regPath);
        
        /*数据存放格式：
         dic{
         key:username value:arr{
         dic0 dic1 dic2
         }
         
         */
        if ([fm fileExistsAtPath:regPath]) {
            
            
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithContentsOfFile:regPath];
            //第一次登陆，之前没数据
            if ([tempDic valueForKey:self.account] == nil) {
                NSArray *arr = [NSArray arrayWithObject:orderDict];
                
                [tempDic setValue:arr forKey:self.account];
            }
            //        登陆过，有数据
            else{
                NSMutableArray *arr = [tempDic valueForKey:self.account];
                [arr addObject:orderDict];
                [tempDic setValue:arr forKey:self.account];
            }
            [tempDic writeToFile:regPath atomically:YES];
            NSLog(@"文件存在");
        }
        else{
            [fm createFileAtPath:regPath contents:nil attributes:nil];
            NSLog(@"新建文件");
            NSArray *arr = [NSArray arrayWithObject:orderDict];
            NSDictionary *dict = [NSDictionary dictionaryWithObject:arr forKey:self.account];
            [dict writeToFile:regPath atomically:YES];
        }
        [UIView animateWithDuration:0.5 animations:^{
            self.isDim = NO;
        }];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [[UIApplication sharedApplication].windows[0].rootViewController presentViewController:alert animated:YES completion:^{
        
        }];
 
}



@end
