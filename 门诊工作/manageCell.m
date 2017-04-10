//
//  manageCell.m
//  门诊工作
//
//  Created by Xuan on 2017/3/13.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "manageCell.h"
#import "LXButton.h"


@implementation manageCell{
    UIImageView *iconView;
    UILabel *nameLabel;
    UILabel *telLabel;
    UIButton *telBtn;
    UIView *containView;
    UIView *LXBtn;
}

+ (UITableViewCell *)tableViewToCell:(UITableView *)tableView{
    static NSString *idd = @"cell";
    manageCell *cell = [tableView dequeueReusableCellWithIdentifier:idd];
    if (cell == nil) {
        cell = [[manageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idd];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stig"]];
        
        iconView.layer.masksToBounds = YES;
        iconView.layer.cornerRadius = 22;
        [self addSubview:iconView];
        
        
        nameLabel = [UILabel new];
//        nameLabel.backgroundColor = [UIColor redColor];
        [self addSubview:nameLabel];
        
        telLabel = [UILabel new];
//        telLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:telLabel];
        
        containView = [UIView new];
        containView.backgroundColor = [UIColor whiteColor];
        [self addSubview:containView];
        
       
        
        [self addSubview:telBtn];
        //masnory autolayout
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(40);
            make.top.equalTo(self).with.offset(20);

            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(iconView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(500, 40));
            make.left.equalTo(iconView.mas_right).with.offset(15);
        }];
       
        [containView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconView.mas_bottom).with.offset(15);
            make.centerX.equalTo(self);
            make.width.mas_equalTo(330);
            make.height.mas_equalTo(90);
        }];
        
    }
    
    return self;
}

- (void)setRp:(regPerson *)rp
{
    _rp = rp;
    LXBtn = [LXButton initWithDoctorName:rp.doctorName className:rp.className];
    
    LXBtn.x = 0;
    LXBtn.y = 0;
    [containView addSubview:LXBtn];
    nameLabel.text = [NSString stringWithFormat:@"%@",rp.nameStr];
    NSLog(@"doctor:%@  class:%@",rp.doctorName,rp.className);
    telLabel.text = [NSString stringWithFormat:@"联系电话:%@",rp.telStr];
    
}


@end
