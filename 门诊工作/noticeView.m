
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
@interface noticeView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation noticeView{
    UIButton *cover;
    UIView *containView;
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
    
    containView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, 330, 150)];
    containView.centerX = self.centerX;
    [self addSubview:containView];
    CGFloat topViewH = 35;
    //圆角
    
    
    
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
    
//    closeBtn.backgroundColor = [UIColor blackColor];
    [closeBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:closeBtn];
    
    UITableView *tView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), containView.width, containView.height - 2 * topViewH)];
    tView.scrollEnabled = NO;
    tView.delegate = self;
    tView.dataSource = self;
    cellH = tView.height / 2;
    tView.allowsSelection = NO;
    tView.rowHeight = cellH;
    [containView addSubview:tView];
    
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tView.frame), containView.width, topViewH)];
    [bottomBtn setBackgroundColor:[UIColor orangeColor]];
    [bottomBtn setTitle:@"立即挂号" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [containView addSubview:bottomBtn];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    containView.layer.cornerRadius = 8;
    containView.clipsToBounds=YES;

    
    
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    noticeCell *cell = [noticeCell cellWithTableview:tableView];
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    cell.backgroundColor = [UIColor yellowColor];
    UILabel *nameLabel = [UILabel new];
    nameLabel.textColor = [UIColor blueColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    UITextField *textField = [UITextField new];
    textField.tag = indexPath.row;
    textField.delegate = self;
//    [textField addTarget:self  action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [cell.contentView addSubview:textField];
    if (indexPath.row == 0) {
        textField.placeholder = @"请输入您的姓名";
        nameLabel.text = @"姓名";

    }else{
        textField.placeholder = @"请输入您的电话";

        nameLabel.text = @"电话";

    }
    [cell.contentView addSubview:nameLabel];
    
    
   
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.centerY.equalTo(cell.contentView);
        make.left.equalTo(cell.contentView).with.offset(50);
    
        
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_right).offset(20);
        make.width.equalTo(@(150));
        make.height.equalTo(@(cellH));
    }];
    
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
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您正在挂号" preferredStyle:UIAlertControllerStyleAlert];
//    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//        NSLog(@"点击取消");
////
//    }]];
  
}

- (void)bottomBtnClick
{
    [self endEditing:YES];
    if (nameStr == nil|| telStr == nil) {
        NSLog(@"有空");
        return;
    }
    else{
    NSLog(@"name:%@",nameStr);
    NSLog(@"tel:%@",telStr);

   
//    [self endEditing:YES];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    //用[NSDate date]可以获取系统当前时间
    NSString *regTime = [dateFormatter stringFromDate:[NSDate date]];
   
    
    NSDictionary *dcDict = [NSDictionary dictionaryWithObjectsAndKeys:_m.className,@"className",_doctorName,@"doctorName",nameStr,@"nameStr",telStr,@"telStr",_m.departName,@"departName",regTime,@"regTime" ,nil];
//    NSLog(@"%@",_m.departName);
    
    
    
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
//        NSMutableArray *tempArr = [NSMutableArray arrayWithContentsOfFile:regPath];
//        [tempArr addObject:dcDict];
//        [tempArr writeToFile:regPath atomically:YES];
//        NSArray *arr = [NSArray arrayWithObjects:dcDict,nil];
//
//        [arr writeToFile:regPath atomically:YES];
        
        
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithContentsOfFile:regPath];
        //第一次登陆，之前没数据
        if ([tempDic valueForKey:self.userName] == nil) {
            NSArray *arr = [NSArray arrayWithObject:dcDict];
//            NSDictionary *dict = [NSDictionary dictionaryWithObject:dcDict forKey:self.userName];
            [tempDic setValue:arr forKey:self.userName];
        }
//        登陆过，有数据
        else{
            NSMutableArray *arr = [tempDic valueForKey:self.userName];
            [arr addObject:dcDict];
            [tempDic setValue:arr forKey:self.userName];
        }
        [tempDic writeToFile:regPath atomically:YES];

//        NSMutableArray *arr = [tempDic valueForKey:self.userName];
//        [arr addObject:dcDict];
//        [tempDic setValue:arr forKey:@"username"];
//        [tempDic writeToFile:regPath atomically:YES];
        NSLog(@"文件存在");
    }
    else{
        [fm createFileAtPath:regPath contents:nil attributes:nil];
        NSLog(@"新建文件");
        NSArray *arr = [NSArray arrayWithObject:dcDict];
//        [tempDic setValue:arr forKey:self.userName];

        NSDictionary *dict = [NSDictionary dictionaryWithObject:arr forKey:self.userName];
        
        
        [dict writeToFile:regPath atomically:YES];
//        NSArray *arr = [NSArray arrayWithObjects:dcDict, nil];
//        [arr writeToFile:regPath atomically:YES];
        
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
    
}



@end
