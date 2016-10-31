//
//  ViewController.m
//  字典转模型
//
//  Created by qianfeng on 16/10/27.
//  Copyright © 2016年 cz. All rights reserved.
//

#import "ViewController.h"
#import "CZExtension.h"
#import "CZModel.h"
#import "City.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSArray *ModelArr = [NSArray arrayWithContentsOfURL:url];
    /*
    Root *root = [Root ModelWithDic:dict];
    NSLog(@"root.status == %ld; root.info == %@", (long)root.status, root.info);
    NSLog(@"*******************************************************");
    for (Data *data in root.data) {
        NSLog(@"%@\n%@\n%@\n%@\n%@", data.nick_name, data.course_time, data.opus_count, data.user_id, data.aaa);
        NSLog(@"---------------------------");
        for (List *list in data.list) {
            NSLog(@"hand_id = %@, host_pic = %@, xxx = %@", list.hand_id, list.host_pic, list.xxx);
        }
         NSLog(@"---------------------------");
    }
    NSLog(@"*******************************************************");
   */
//    [self createPropertyCodeWithDict:dict[0]];
    
    
    
    NSArray *Arr = [City ModelArrayWithArray:ModelArr];
    for (City *city in Arr) {
        NSLog(@"%@---%@", city.name, city.pinyin);
    }
    
}

- (void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    NSMutableString *strM = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        //        NSLog(@"%@ %@",propertyName,[value class]);
        NSString *code;
        
        if ([value isKindOfClass:NSClassFromString(@"NSString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
            ;
        }
        [strM appendFormat:@"\n%@\n",code];

    }];
    
    NSLog(@"%@",strM);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
