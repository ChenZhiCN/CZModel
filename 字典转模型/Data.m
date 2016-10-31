//
//  Item.m
//  字典转模型
//
//  Created by cz on 16/10/29.
//  Copyright © 2016年 cz. All rights reserved.
//

#import "Data.h"

@implementation Data

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@-%@-%@,", _list, _nick_name, _user_id];
}

@end
