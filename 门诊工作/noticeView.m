
//
//  noticeView.m
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "noticeView.h"
#import "manageController.h"
#import "noticeCell.h"
@interface noticeView()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation noticeView{
    UIButton *cover;
    UIView *containView;
    CGFloat cellH;
    NSMutableDictionary *nameDict;
    NSMutableDictionary *telDict;
    
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
    cover.backgroundColor = [UIColor clearColor];
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
    if (indexPath.row == 0) {
        nameLabel.text = @"姓名";

    }else{
        nameLabel.text = @"电话";

    }
    [cell.contentView addSubview:nameLabel];
    
    
    UITextField *textField = [UITextField new];
    textField.tag = indexPath.row;
    textField.backgroundColor = [UIColor lightGrayColor];
    textField.delegate = self;
    [textField addTarget:self  action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [cell.contentView addSubview:textField];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(CGPointMake(50, cell.contentView.centerY));
//        make.left.top.equalTo(cell.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
        make.size.mas_equalTo(CGSizeMake(80, 30));
//        make.top.equalTo(cell.contentView).offset(10);
        make.centerY.equalTo(cell.contentView);
        make.left.equalTo(cell.contentView).offset(10);

//        make.centerY.mas_equalTo(cell.contentView.centerY);
    
        
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(cell.contentView).offset(20);
        make.width.equalTo(@(150));
        make.height.equalTo(@(cellH));
    }];
    
    return cell;
}

- (void)textFieldChange:(UITextField *)textField
{
    if (textField.tag == 0) {
        [nameDict setValue:textField.text forKey:@"name"];
    }
    else{
        [telDict setValue:textField.text forKey:@"tel"];
    }
    
    NSLog(@"name:%@",[nameDict valueForKey:@"name"]);
    NSLog(@"tel:%@",[telDict valueForKey:@"tel"]);
}




- (void)closeBtnClick
{
//    if (self.btnBlock != nil) {
//        self.btnBlock(self);
//        
//    }
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
    NSDictionary *dcDict = [NSDictionary dictionaryWithObjectsAndKeys:_m.className,@"className",_doctorName,@"doctorName", nil];
    
    NSFileManager *fm = [NSFileManager defaultManager];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"app_home_doc: %@",documentsDirectory);
    NSString *regPath = [documentsDirectory stringByAppendingPathComponent:@"regList.plist"];

    if ([fm fileExistsAtPath:regPath]) {
        NSArray *arr = [NSArray arrayWithObjects:telDict,nameDict,dcDict,nil];
        [arr writeToFile:regPath atomically:YES];
        NSLog(@"文件存在");
    }
    else{
        [fm createFileAtPath:regPath contents:nil attributes:nil];
        NSLog(@"新建文件");
    }
    

    
//    NSString *p = @"/Users/lxmm/Desktop/lxmm/门诊工作/门诊工作";
//
//    NSString *path = [p stringByAppendingPathComponent:@"RegList.plist"];
//    
//    NSArray *arr = [NSArray arrayWithObjects:telDict,nameDict, nil];
//    [arr writeToFile:path atomically:YES];
//
//    NSMutableDictionary *data1 = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
//    NSLog(@"%@", data1);

    
    [UIView animateWithDuration:0.5 animations:^{
        self.isDim = NO;
    }];
}



@end
