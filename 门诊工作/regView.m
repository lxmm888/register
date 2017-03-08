//
//  regView.m
//  门诊工作
//
//  Created by Xuan on 2017/3/6.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "regView.h"
#import "departModel.h"
#import "regController.h"

@interface regView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation regView{
    NSMutableArray *dataSource;
    UIView *detailView;
    NSMutableArray *classViewArr;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dataInit];
        [self setViews];
    }
    return self;
}

- (void)dataInit
{
    dataSource = [NSMutableArray array];
    classViewArr = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DepartmentList.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in arr) {
        departModel *model = [departModel dictToModel:dict];
        [dataSource addObject:model];
    }
}

- (void)setViews
{
    CGFloat tableWidth = 100;

    detailView = [[UIView alloc] initWithFrame:CGRectMake(tableWidth, 0, self.width - tableWidth, self.height)];
    detailView.backgroundColor = [UIColor whiteColor];
    [self addSubview:detailView];
    UITableView *tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, tableWidth, self.height)];
    tView.dataSource = self;
    tView.delegate = self;
    NSIndexPath *ip = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [tView setSeparatorColor:[UIColor clearColor]];
    [tView setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:tView];

    [self tableView:tView didSelectRowAtIndexPath:ip];
    [tView selectRowAtIndexPath:ip animated:NO scrollPosition:UITableViewScrollPositionNone];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idd = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idd];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idd];
    }
    
    departModel *model = dataSource[indexPath.row];
    cell.textLabel.text = model.departName;
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    for (int i = 0; i < dataSource.count; i ++) {
//        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(100, 0, self.width - 100, self.height)];
//        
//    }
    NSLog(@"%@",indexPath);
    for (UIView *view in detailView.subviews) {
        [view removeFromSuperview];
    }
    departModel *model = dataSource[indexPath.row];
    for (int i = 0; i < model.classModelArr.count; i ++) {
        classModel *m = model.classModelArr[i];
        MyButton *btn = [[MyButton alloc] initWithFrame:CGRectMake(0, i * 44, 100, 44)];
        [btn setTitle:m.className forState:UIControlStateNormal];
        btn.m=m;
//        [btn setFont:[UIFont systemFontOfSize:14]];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setBackgroundColor:[UIColor whiteColor]];
        [detailView addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    
}

- (void)btnClick:(MyButton*)btn
{
//    NSLog(@"%lu",(unsigned long)btn.m.classDoctor.count);

    classModel *m = btn.m;
    regController *rc = [regController new];
    rc.classDoctor = m.classDoctor;
    NSLog(@"%lu",(unsigned long)m.classDoctor.count);

    if (self.btnBlock != nil) {
        self.btnBlock([regController new]);
        
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

@implementation MyButton

@end
