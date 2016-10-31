//
//  NSObject+Model.h
//  字典转模型
//
//  Created by cz on 16/10/29.
//  Copyright © 2016年 cz. All rights reserved.
//

#import <Foundation/Foundation.h>
//字典转模型

@interface NSObject (CZModel)

/**
 通过字典创建模型
 */
+ (instancetype)ModelWithDic:(NSDictionary *)dic;

+ (NSArray *)ModelArrayWithArray:(NSArray *)array;


/**
 通过Json字符串创建模型，若root目录为数组，

 @param jsonString Json字符串

 @return 若root目录为数组返回模型数组，为字典则返回单个模型

+ (id)objectFromJsonString:(NSString *)jsonString;

- (id)initWithJsonString:(NSString *)jsonString;
*/


@end
