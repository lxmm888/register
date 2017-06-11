
//
//  noticeView.m
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
// 症状描述 预约时间

#import "noticeView.h"
#import "manageController.h"
#import "noticeCell.h"
#import "regPerson.h"
#import "tab.h"
#import "manageController.h"
#import "LXDatePickerView.h"
@interface noticeView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

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
    
    title.text = @"挂号";
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
    
    UIButton *dayBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(doctorNameLabel.frame),doctorNameLabel.y, 100, 20)];
    [dayBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dayBtn setTitle:@"选择日期" forState:UIControlStateNormal];
    [dayBtn addTarget:self action:@selector(dayBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [containView addSubview:dayBtn];
    
    UILabel *noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(iconView.frame) + 25, 200, 20)];
    noticeLabel.text = @"请选择预约时间：";
    noticeLabel.textColor = [UIColor grayColor];
    [containView addSubview:noticeLabel];
    
    
    LXDatePickerView *datePickerView = [[LXDatePickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(noticeLabel.frame) + 10, containView.width, 200)];
    [containView addSubview:datePickerView];
    
    UITableView *tView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), containView.width, containView.height - 2 * topViewH)];
    tView.scrollEnabled = NO;
    tView.delegate = self;
    tView.dataSource = self;
    cellH = tView.height;
    tView.allowsSelection = NO;
    tView.rowHeight = cellH;
//    [containView addSubview:tView];
    
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tView.frame), containView.width, topViewH)];
    [bottomBtn setBackgroundColor:[UIColor orangeColor]];
    [bottomBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [containView addSubview:bottomBtn];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    containView.layer.cornerRadius = 8;
    containView.clipsToBounds=YES;

    
    
}

- (void)dayBtnClick
{
    UIAlertController *daySheet = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"星期一" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [daySheet addAction:action1];
    [[UIApplication sharedApplication].windows[0].rootViewController presentViewController:daySheet animated:YES completion:^{
        
    }];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    NSDate *currentDate = [NSDate date];
    NSLog(@"%@",currentDate);
    datePicker = [[UIDatePicker alloc] init];
    datePicker.height = cellH;
    datePicker.minuteInterval = 15;
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.minimumDate = currentDate;
    [cell.contentView addSubview:datePicker];

    return cell;
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
   
//    [self endEditing:YES];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    //用[NSDate date]可以获取系统当前时间
    NSString *regTime = [dateFormatter stringFromDate:[NSDate date]];
    NSString *orderTime = [dateFormatter stringFromDate:datePicker.date];
        NSLog(@"orderTime: %@",orderTime);
    
    NSDictionary *dcDict = [NSDictionary dictionaryWithObjectsAndKeys:_m.className,@"className",_doctorName,@"doctorName",nameStr,@"nameStr",telStr,@"telStr",_m.departName,@"departName",regTime,@"regTime" ,nil];
//    NSLog(@"%@",_m.departName);
    NSDictionary *orderDict = [NSDictionary dictionaryWithObjectsAndKeys:_m.className,@"className",_doctorName,@"doctorName",self.account,@"telStr",_m.departName,@"departName",self.name,@"nameStr",orderTime,@"regTime",nil];
    
    
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
//        [tempDic setValue:arr forKey:self.userName];

        NSDictionary *dict = [NSDictionary dictionaryWithObject:arr forKey:self.account];
        [dict writeToFile:regPath atomically:YES];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.isDim = NO;
    }];
        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"正在挂号" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
////        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        [alert addAction:okAction];
//        [alert addAction:cancelAction];
//        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController popToViewController:[manageController new] animated:YES];
//
//        
        
    
    
}



@end
