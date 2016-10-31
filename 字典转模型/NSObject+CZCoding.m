//
//  NSObject+CZCoding.m
//  自动解归档
//
//  Created by cz on 16/10/29.
//  Copyright © 2016年 cz. All rights reserved.
//

#import "NSObject+CZCoding.h"
#import <objc/runtime.h>

@implementation NSObject (CZCoding)

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [self cz_encode:encoder];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [self init]) {
        [self cz_decode:decoder];
    }
    return self;
}

/**
 归档的实现
 */
- (void)cz_encode:(NSCoder *)encoder
{
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString* propertyName = [NSString stringWithUTF8String:name];
        [encoder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
    }
}
/**
 解档的实现
 */
- (void)cz_decode:(NSCoder *)decoder
{

    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString* propertyName = [NSString stringWithUTF8String:name];
        [self setValue:[decoder decodeObjectForKey:propertyName] forKey:propertyName];
    }

}

//+ (instancetype)objWithDictionary:(NSDictionary *)dic
//{
//    NSObject *obj = [[self alloc] init];
//    [obj setValuesForKeysWithDictionary:dic];
//    return obj;
//}
//
//
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}
//
//
//- (id)valueForUndefinedKey:(NSString *)key
//{
//    return nil;
//}
@end
