
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
    CGFloat btnH = self.height - contentH;
    //圆角
    self.layer.cornerRadius = 10;
    
    UIButton *topBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.width, btnH)];
    topBtn.backgroundColor = [UIColor orangeColor];
    topBtn.titleLabel.text = @"挂号";
    topBtn.titleLabel.textColor = [UIColor whiteColor];
    
    [self addSubview:topBtn];
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
