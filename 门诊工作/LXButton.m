//
//  LXButton.m
//  门诊工作
//
//  Created by lxmm on 17/4/10.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "LXButton.h"

@implementation LXButton

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
    for (int i = 0; i < 3 ;i ++) {
        
    }
}

+ (UIView *)initWithIconName:(NSString *)iconName titleName:(NSString *)titleName
{
    UIView *containView = [UIView new];
    containView.size = CGSizeMake(200, 30);
    containView.backgroundColor = [UIColor lightGrayColor];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    imageView.frame = CGRectMake(0, 0, 20, 20);
    
    
    [containView addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 0, 100, 40)];
    nameLabel.text = titleName;
//    nameLabel.textColor = [
    [containView addSubview:nameLabel];
    
    return containView;
    
    
}

+ (UIView *)initWithDoctorName:(NSString *)doctorName className:(NSString *)className
{
    CGFloat btnH = 30;
    int btnCount = 3;
    
    
    UIView *containView = [UIView new];
    containView.size = CGSizeMake(200, btnH * btnCount);
//    containView.backgroundColor = [UIColor lightGrayColor];
    
    for (int i = 0; i < btnCount; i ++) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfont-phone"]];
//        imageView.frame = CGRectMake(0, i * btnH, 20, 20);
//        imageView.centerY = btnH * 0.5 * (i + 1);
//        [containView addSubview:imageView];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, i * btnH, 300, btnH)];
        [btn setImage:[UIImage imageNamed:@"iconfont-phone"] forState:UIControlStateNormal];
        btn.imageEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 270);

        switch (i) {
            case 0:
                [btn setTitle:@"李氏中医精神病院" forState:UIControlStateNormal];
                break;
                
            case 1:
                [btn setTitle:className forState:UIControlStateNormal];

                break;

            case 2:
                [btn setTitle:doctorName forState:UIControlStateNormal];

                break;

                
            default:
                break;
        }
        btn.titleEdgeInsets = UIEdgeInsetsMake(10, -20, 10, 0);
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                [containView addSubview:btn];
        
        

//        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 20, imageView.y, 150, 40)];
        
//        [containView addSubview:nameLabel];


    }
    return containView;

}

@end
