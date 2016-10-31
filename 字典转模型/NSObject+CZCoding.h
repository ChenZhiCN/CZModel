//
//  NSObject+CZCoding.h
//  自动解归档
//
//  Created by cz on 16/10/29.
//  Copyright © 2016年 cz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CZCoding) <NSCoding>
/**
 *  解码（从文件中解析对象）
 */
- (void)cz_decode:(NSCoder *)decoder;
/**
 *  编码（将对象写入文件中）
 */
- (void)cz_encode:(NSCoder *)encoder;


//+ (instancetype)objWithDictionary:(NSDictionary *)dic;

@end


/**
 归档/解档的实现
 */
#define CZCodingImplementation \
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self cz_encode:encoder]; \
}\
\
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self cz_decode:decoder]; \
} \
return self; \
} \

