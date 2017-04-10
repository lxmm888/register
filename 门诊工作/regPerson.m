//
//  regPerson.m
//  门诊工作
//
//  Created by lxmm on 17/4/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "regPerson.h"

@implementation regPerson

+ (regPerson *)dictToModel:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (regPerson *)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    self.className = dict[@"className"];
    self.doctorName = dict[@"doctorName"];
    self.telStr = dict[@"telStr"];
    self.nameStr = dict[@"nameStr"];
    return self;
}

@end
