//
//  manageCellView.m
//  门诊工作
//
//  Created by lxmm on 17/4/11.
//  Copyright © 2017年 Xuan. All rights reserved.
//
#define textColo LXColor(181, 181, 181)
#import "manageCellView.h"

@implementation manageCellView{
    NSMutableArray *labelArr;
    UILabel *nameLabel;
    UILabel *timeLabel;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        labelArr = [NSMutableArray array];
        self.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:251/255.0 alpha:1.0];
//        设置contentView
        UIView *contentView = [[UIView alloc] init];//initWithFrame:CGRectMake(12, 80, 351, 140)];
        contentView.backgroundColor = [UIColor whiteColor];
        contentView.layer.cornerRadius = 10;
        contentView.layer.shadowOffset = CGSizeMake(0, 0);
        contentView.layer.shadowColor = [UIColor orangeColor].CGColor;
        contentView.layer.shadowOpacity = 0.25;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        float width = contentView.bounds.size.width;
        float height = contentView.bounds.size.height;
        float x = contentView.bounds.origin.x;
        float y = contentView.bounds.origin.y;
        float addWH = 1;
        
        CGPoint topLeft      = contentView.bounds.origin;
        CGPoint topMiddle = CGPointMake(x+(width/2),y-addWH);
        CGPoint topRight     = CGPointMake(x+width,y);
        
        CGPoint rightMiddle = CGPointMake(x+width+addWH,y+(height/2));
        
        CGPoint bottomRight  = CGPointMake(x+width,y+height);
        CGPoint bottomMiddle = CGPointMake(x+(width/2),y+height+addWH);
        CGPoint bottomLeft   = CGPointMake(x,y+height);
        
        
        CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
        
        [path moveToPoint:topLeft];
        //添加四个二元曲线
        [path addQuadCurveToPoint:topRight
                     controlPoint:topMiddle];
        [path addQuadCurveToPoint:bottomRight
                     controlPoint:rightMiddle];
        [path addQuadCurveToPoint:bottomLeft
                     controlPoint:bottomMiddle];
        [path addQuadCurveToPoint:topLeft
                     controlPoint:leftMiddle];
        //设置阴影路径
        contentView.layer.shadowPath = path.CGPath;
        [self addSubview:contentView];
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"病人1"]];
        iconView.size = CGSizeMake(65, 65);
//        iconView.frame = CGRectMake(26, 23, 65, 65);
        [self addSubview:iconView];
        
        
        
        nameLabel = [UILabel new];//[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconView.frame) + 9, iconView.y + 13, 100, 18)];
        nameLabel.textColor = [UIColor orangeColor];
        nameLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:nameLabel];
        
        UILabel *locationLabel = [UILabel new];//[[UILabel alloc] initWithFrame:CGRectMake(nameLabel.x, CGRectGetMaxY(nameLabel.frame) + 2, 200, 23)];
        locationLabel.text = @"广州，广东";
        locationLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
        locationLabel.textColor = textColo;
        
        [self addSubview:locationLabel];
        
        //masnory
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
//            make.top.equalTo(self).with.offset(80);
            make.bottom.equalTo(self).with.offset(-30);
            make.size.mas_equalTo(CGSizeMake(self.width * 0.9, 130));
        }];
        
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(contentView).with.offset(20);
            make.centerY.mas_equalTo(contentView.mas_top).with.offset(-20);
            make.size.mas_equalTo(CGSizeMake(65, 65));
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).with.offset(10);
            make.top.equalTo(iconView).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(100, 18));
        }];
        
        [locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(nameLabel);
            make.top.mas_equalTo(nameLabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(100, 18));
            
        }];
        
        _cellH = CGRectGetMaxY(contentView.frame) + 20;
        
//        [locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(iconView.mas_right).with.offset(10);
//            make.top.equalTo(iconView).with.offset(30);
//            make.size.mas_equalTo(CGSizeMake(200, 23));
//            
//        }];
        
        CGFloat iconH = 22;
        for (int i = 0; i < 3; i ++) {
            UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon%d",i]]];
            im.frame = CGRectMake(35, 22 + (iconH + 15) * i, iconH, iconH);
            [contentView addSubview:im];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(im.frame) + 22, 0, 200, 15)];
            label.centerY = im.centerY;
            label.tag = i;
            label.font = [UIFont systemFontOfSize:15];
            label.textColor = textColo;
            [labelArr addObject:label];
            [contentView addSubview:label];
            if (i == 2) {
                timeLabel = [UILabel new];
                timeLabel.textAlignment = NSTextAlignmentRight;
                timeLabel.textColor = textColo;
                timeLabel.font = [UIFont systemFontOfSize:13];
                [self addSubview:timeLabel];
                
                [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(contentView.mas_right).with.offset(-20);
                    make.bottom.mas_equalTo(contentView.mas_bottom).with.offset(-5);
                    make.size.mas_equalTo(CGSizeMake(150, 23));
                }];
            }
        }
        
    }
    return self;
}

- (void)setRegPerson:(regPerson *)regPerson
{
    
    _regPerson = regPerson;
    nameLabel.text = regPerson.nameStr;
    timeLabel.text = regPerson.regTime;
    for (UILabel *label in labelArr) {
        switch (label.tag) {
            case 0:
//                电话号码
                label.text = regPerson.telStr;
                break;
                
            case 1:
//                具体科室
                label.text = [NSString stringWithFormat:@"%@ %@",regPerson.departName,regPerson.className];
                break;
                
            case 2:
//                所选医生姓名
                label.text = [NSString stringWithFormat:@"%@ 医生",regPerson.doctorName];
                break;
                
                
            default:
                break;
        }
    }
    

    
}

@end
