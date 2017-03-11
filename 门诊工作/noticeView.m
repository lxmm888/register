
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
    CGFloat topViewH = 30;
    CGFloat btnH = self.height - contentH;
    //圆角
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, topViewH)];
    topView.backgroundColor = [UIColor orangeColor];
    [self addSubview:topView];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
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
//    closeBtn.titleLabel.text = @"挂号";
//    closeBtn.titleLabel.textColor = [UIColor whiteColor];
    
    [topView addSubview:closeBtn];
    
    
    self.layer.cornerRadius = 8;

}

- (void)closeBtnClick
{
    if (self.btnBlock != nil) {
        self.btnBlock(self);
        
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
