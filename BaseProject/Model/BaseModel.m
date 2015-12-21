//
//  BaseModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return  [propertyName underlineFromCamel];
    
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
    
}
@end

