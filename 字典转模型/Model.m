//
//  Model.m
//  字典转模型
//
//  Created by cz on 16/10/29.
//  Copyright © 2016年 cz. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (instancetype)ModelWithDic:(NSDictionary *)dic
{
    Model *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
