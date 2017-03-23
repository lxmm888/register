
//
//  noticeView.m
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "noticeView.h"

@implementation noticeView
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
    CGFloat topViewH = 40;
    CGFloat btnH = self.height - contentH;
    //圆角
    
    
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, topViewH)];
    topView.backgroundColor = [UIColor orangeColor];
    [self addSubview:topView];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    title.backgroundColor = [UIColor lightGrayColor];
    title.centerX = topView.centerX;
    title.centerY = topView.centerY;
    title.textAlignment = NSTextAlignmentCenter;
//    title.center = topView.center;
//    title.size = CGSizeMake(100, 30);
    title.text = @"挂号";
    title.textColor = [UIColor whiteColor];
    [topView addSubview:title];
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 20, 20)];
    closeBtn.centerY = topView.centerY;
    closeBtn.backgroundColor = [UIColor blackColor];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:closeBtn];
    
    
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.height - topViewH, self.width, topViewH)];
    [bottomBtn setBackgroundColor:[UIColor orangeColor]];
    [bottomBtn setTitle:@"立即挂号" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:bottomBtn];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.layer.cornerRadius = 8;
    self.clipsToBounds = YES;
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
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您正在挂号" preferredStyle:UIAlertControllerStyleAlert];
//    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//        NSLog(@"点击取消");
//        
//    }]];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"RegList.plist" ofType:nil];
    NSString *p = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    //    NSString *plistPath1 = [paths objectAtIndex:0]//[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *path = [p stringByAppendingPathComponent:@"RegList.plist"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:path]) {
        BOOL isCreate=[fm createFileAtPath:path contents:nil attributes:nil];
//        [[NSDictionary dictionaryWithObject:@"value" forKey:@"key"]writeToFile:path atomically:YES];
//        NSLog(@"%@",path);
        NSLog(@"%@",isCreate?@"c":@"f");
    }
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    [dict setObject:@"leiloumou" forKey:@"www"];
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
    
    
//    [dict setObject:@"leiloumou" forKey:@"www"];
//    [dict writeToFile:path atomically:YES];
//    NSDictionary *dict2 = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSLog(@"%@",dict2);
    
//    NSString *str = _m.className;
//    [arr addObject:str];
//    
//    [arr writeToFile:path atomically:YES];
    
    //
//    
//    
//    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        NSLog(@"点击确认");
//        
//    }]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
