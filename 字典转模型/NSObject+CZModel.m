//
//  NSObject+Model.m
//  字典转模型
//
//  Created by cz on 16/10/29.
//  Copyright © 2016年 cz. All rights reserved.
//

#import "NSObject+CZModel.h"
#import <objc/runtime.h>


@implementation NSObject (CZModel)

//创建对象
+ (instancetype)ModelWithDic:(NSDictionary *)dic
{
    id objc = [[self alloc] init];
    /*runtime: 根据模型中的属性，去字典中去除对应的value给模型属性赋值*/
    //*1.获取模型中所有属性 key
    unsigned int outCount;
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    //*2.通过成员列表名字去找 value
    for (int i = 0; i < outCount; i++) {
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivarList[i])];
        NSString *ivarType = [NSString stringWithUTF8String: ivar_getTypeEncoding(ivarList[i])];
        // @\"Model\" -> Model
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        //3.去字典中去查找对应的value给模型属性赋值
        
        NSString *key = [ivarName substringFromIndex:1];

        id value = dic[key];
        //二级转换：判断value是否为字典，如果是则转换对应的模型
        //并且是自定义对象才转换
        if([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"])
        {
            Class modelClass = NSClassFromString(ivarType);
            value = [modelClass ModelWithDic:value];
        }
        /*判断value是否为数组，且属性名为模型类名，如果是则转换对应的模型数组*/
        if ([value isKindOfClass:[NSArray class]] && NSClassFromString([self toUpper:key])) {

            Class ModelClass = NSClassFromString([self toUpper:key]);
            value = [ModelClass ModelArrayWithArray:value];
        }
        if(value)
        {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

+ (NSArray *)ModelArrayWithArray:(NSArray *)array
{
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrM addObject:[self ModelWithDic:dic]];
    }
    return arrM;

}

/*首字母转大写*/
- (NSString *)toUpper:(NSString *)str1
{
    NSString *str = [str1 copy];
    char temp = [str characterAtIndex:0] - 32;
    NSRange range = NSMakeRange(0, 1);
    str = [str stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%c",temp]];

    return str;
}


@end

