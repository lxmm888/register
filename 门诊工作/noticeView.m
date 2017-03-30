
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
    CGFloat cellH;
    NSMutableDictionary *nameDict;
    NSMutableDictionary *telDict;
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setViews];
    }
    return self;
}

- (void)setViews
{
    CGFloat contentH = 140;
    CGFloat topViewH = 35;
    CGFloat btnH = self.height - contentH;
    //圆角
    
    
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, topViewH)];
    topView.backgroundColor = [UIColor orangeColor];
    [self addSubview:topView];

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
    closeBtn.backgroundColor = [UIColor blackColor];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:closeBtn];
    
    UITableView *tView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), self.width, self.height - 2 * topViewH)];
    tView.delegate = self;
    tView.dataSource = self;
    cellH = tView.height / 2;
    tView.allowsSelection = NO;
    tView.rowHeight = cellH;
    [self addSubview:tView];
    
    
    
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.height - topViewH, self.width, topViewH)];
    [bottomBtn setBackgroundColor:[UIColor orangeColor]];
    [bottomBtn setTitle:@"立即挂号" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:bottomBtn];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.layer.cornerRadius = 8;
    self.clipsToBounds = YES;
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
    nameLabel.text = @"姓名";
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
    nameDict = [NSMutableDictionary dictionary];
    telDict = [NSMutableDictionary dictionary];
    if (textField.tag == 0) {
        [nameDict setValue:textField.text forKey:@"name"];
    }
    else{
        [telDict setValue:textField.text forKey:@"tel"];
    }
    
//    NSLog(@"%@",[dict valueForKey:@"text"]);
}




- (void)closeBtnClick
{
    if (self.btnBlock != nil) {
        self.btnBlock(self);
        
    }
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您正在挂号" preferredStyle:UIAlertControllerStyleAlert];
//    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//        NSLog(@"点击取消");
//        
//    }]];
    //
}

- (void)bottomBtnClick
{
//    NSString *path =[[NSBundle mainBundle] pathForResource:@"RegList.plist" ofType:nil];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
//    [dict setObject:@"888" forKey:@"111"];
//    [dict writeToFile:path atomically:YES];
    
    
    NSString *p = @"/Users/lxmm/Desktop/lxmm/门诊工作/门诊工作";
//    NSString *p = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    NSString *path = [p stringByAppendingPathComponent:@"RegList.plist"];
    [telDict writeToFile:path atomically:YES];
    [nameDict writeToFile:path atomically:YES];
//    NSLog(@"%@",path);
//    NSFileManager *fm = [NSFileManager defaultManager];
//    if (![fm fileExistsAtPath:path]) {
//        
//        [fm createFileAtPath:path contents:nil attributes:nil];
//        NSDictionary *dic = [NSDictionary dictionaryWithObject:@"hahaha" forKey:@"dicName"];
//        [dic writeToFile:path atomically:YES];
//        
//    }
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
//    [dict setObject:[_m.classDoctor objectAtIndex:_row] forKey:_m.className];
//    [dict writeToFile:path atomically:YES];
//
//    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//    NSString *plistPath1 = [paths objectAtIndex:0];
//    
//    //得到完整的文件名
//    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"RegList.plist"];
    //输入写入
//    BOOL isWrite = [dict writeToFile:path atomically:YES];
    //那怎么证明我的数据写入了呢？读出来看看
    NSMutableDictionary *data1 = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"%@", data1);
    for (UIViewController *vc in _regController.tabBarController.viewControllers) {
        if ([vc isKindOfClass:[manageController class]]) {
            [((manageController *)vc) initData];
            [((manageController *)vc).tView reloadData];
        }
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
