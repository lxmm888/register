//
//  desView.m
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "desView.h"
#import "LXBorder.h"
@implementation desView

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
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    sv.scrollEnabled = YES;
    [self addSubview:sv];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 100)];
    topView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:topView];
    
    LXBorder *border = [[LXBorder alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), self.width, 5)];
    [sv addSubview:border];
    
    CGFloat desLabelH = 20;
    UILabel *desLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(border.frame) + 10, 100, desLabelH)];
    desLabel.textAlignment = NSTextAlignmentLeft;
    desLabel.text = @"简介:";
    [sv addSubview:desLabel];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(desLabel.frame), self.width,self.height - desLabelH)];
    textView.userInteractionEnabled = NO;
    textView.text = @"\tK322李氏精神病医院是一个比较特殊的专科医院，无论从设址、服务对象、管理模式、医疗护理方式、方法，以及社会地位等诸多方面，都显示出其不同于综合医院或其他专科医院的特点。近年来，随着我国精神病患病率的提高，精神病治疗服务需求不断增加，供需缺口将进一步加大。但受社会认知和历史遗留等问题的影响，我国精神病医院的发展道路越走越窄，想要突破就必须回到源头，从提升医院的核心竞争能力入手。\n\t李氏精神病医院应在保证医疗安全的前提下，以低廉的价格优先收治疗社会三无人员和慈善救助病人，取得较好的社会效益。同时，根据国内其他医院的发展经验，精神病医院可以扩大老年病区，开展临终关怀服务，为政府和千万家庭分忧。";
    textView.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
    textView.font = [UIFont systemFontOfSize:15];
//    textView.contentInset = UIEdgeInsetsMake(10, 20, 10, 20);
    sv.contentSize = CGSizeMake(self.width, CGRectGetMaxY(textView.frame));

    [sv addSubview:textView];
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
