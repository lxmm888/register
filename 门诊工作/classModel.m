//
//  classModel.m
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "classModel.h"

@implementation classModel
- (classModel *)initDictToModel:(NSDictionary *)dict{
    self = [super init];
    if(self){
        //        [dict setValuesForKeysWithDictionary:dict];
        self.className = [dict valueForKey:@"className"];
        self.classDoctor = [dict valueForKey:@"classDoctor"];

        //
    }
    return self;
}



+ (classModel *)dictToModel:(NSDictionary *)dict{
    return [[self alloc] initDictToModel:dict];
    
}
@end
