//
//  regPerson.h
//  门诊工作
//
//  Created by lxmm on 17/4/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface regPerson : NSObject

@property (nonatomic, strong) NSString *nameStr;
@property (nonatomic, strong) NSString *telStr;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *doctorName;



+ (regPerson *)dictToModel:(NSDictionary *)dict;
- (regPerson *)initWithDict:(NSDictionary *)dict;

@end
