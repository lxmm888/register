//
//  departModel.m
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "departModel.h"

@implementation departModel
- (departModel *)initDictToModel:(NSDictionary *)dict{
    self = [super init];
    if(self){
        //        [dict setValuesForKeysWithDictionary:dict];
        self.departClass = [dict valueForKey:@"departClass"];
        self.departName = [dict valueForKey:@"departName"];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in _departClass) {
            classModel *model = [classModel dictToModel:dic];
            [arr addObject:model];
        }
        self.classModelArr = [arr copy];
        
    }
    return self;
}

+ (departModel *)dictToModel:(NSDictionary *)dict{
    return [[self alloc] initDictToModel:dict];

}
@end
