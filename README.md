# CZModel
## 字典转模型
导入 NSObject+Model.h
/**
 通过字典创建模型
 */
+ (instancetype)ModelWithDic:(NSDictionary *)dic;
/**
 通过数组创建模型
 */
+ (NSArray *)ModelArrayWithArray:(NSArray *)array;

具体使用参照提供的demo，一个二级转换的例子🌰


## 自动解归档
导入 NSObject+CZCoding.h
利用runtime动态获取属性，给NSObject添加类别，在类别中实现解归档的协议，使继承NSObject的模型可以自动解归档
