//
//  meController.m
//  门诊工作
//
//  Created by lxmm on 17/4/20.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "meController.h"
#import "loginController.h"
@interface meController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tView;
    NSMutableArray *dataSource;
}

@end

@implementation meController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];  
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self initData];
    [self setTableView];
    // Do any additional setup after loading the view.
}
- (void)initData
{
    dataSource = [NSMutableArray array];
    
    NSDictionary *dict0 = [NSDictionary dictionaryWithObjectsAndKeys:_name,@"title",@"stig",@"iconName",@"WeChat ID:k211",@"detail", nil];
    NSArray *arr0 = [NSArray arrayWithObject:dict0];
    [dataSource addObject:arr0];
    
    NSDictionary *dict10 = [NSDictionary dictionaryWithObjectsAndKeys:@"collect",@"iconName",@"收藏",@"title", nil];
    NSDictionary *dict11 = [NSDictionary dictionaryWithObjectsAndKeys:@"vip",@"iconName",@"会员特权",@"title", nil];
    
    NSDictionary *dict12 = [NSDictionary dictionaryWithObjectsAndKeys:@"card",@"iconName",@"卡片",@"title", nil];
    
    NSDictionary *dict13 = [NSDictionary dictionaryWithObjectsAndKeys:@"pay",@"iconName",@"支付",@"title", nil];
    NSArray *arr1 = [NSArray arrayWithObjects:dict10,dict11,dict12,dict13, nil];
    [dataSource addObject:arr1];
    
    NSDictionary *dict20 = [NSDictionary dictionaryWithObjectsAndKeys:@"new_friend",@"iconName",@"退出登录",@"title", nil];
    NSArray *arr2 = [NSArray arrayWithObject:dict20];
    [dataSource addObject:arr2];
    
    
}

- (void)setTableView
{
    tView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tView.dataSource = self;
    tView.delegate = self;
    [self.view addSubview:tView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = dataSource[section];
    return arr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 88;
    }
    else{
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    NSArray *arr = dataSource[indexPath.section];
    NSDictionary *dict = arr[indexPath.row];
    UIImage *im = [UIImage imageNamed:[dict valueForKey:@"iconName"]];
    if (indexPath.section == 0) {
        UIImageView *iconView = [[UIImageView alloc] initWithImage:im];
//        iconView.layer.cornerRadius = 10.0;
        CGFloat WH = 50;//btnW and btnH
        CGFloat XY = (88 - WH) * 0.5;//btnX and Y
        iconView.frame = CGRectMake(XY, XY, WH, WH);
        [cell.contentView addSubview:iconView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame) + 25, iconView.y, 200, 80)];
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.numberOfLines = 2;
        
        nameLabel.text = [NSString stringWithFormat:@"%@\n%@",[dict valueForKey:@"title"],[dict valueForKey:@"detail"]];
        [nameLabel sizeToFit];

        [cell.contentView addSubview:nameLabel];
    }
    else{
    cell.imageView.image = im;
    cell.textLabel.text = [dict valueForKey:@"title"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 2){
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否退出登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
            [UIApplication sharedApplication].keyWindow.rootViewController = [[loginController alloc] init];

        }];
        UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"点击取消");
            
        }];
        [ac addAction:noAction];
        [ac addAction:yesAction];

        [self presentViewController:ac animated:yesAction completion:nil];
//        [UIApplication sharedApplication].keyWindow.rootViewController = [[loginController alloc] init];
    }
    else{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:vc animated:YES];
    }
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
