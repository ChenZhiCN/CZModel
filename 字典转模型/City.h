//
//  City.h
//  字典转模型
//
//  Created by cz on 16/10/29.
//  Copyright © 2016年 cz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, copy) NSString *pinyin;

@property (nonatomic, assign) int id;

@property (nonatomic, assign) int lat;

@property (nonatomic, assign) int lng;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *divisionStr;

@end
