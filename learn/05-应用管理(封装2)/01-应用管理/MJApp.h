//
//  MJApp.h
//  01-应用管理
//
//  Created by apple on 14-3-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  模型类:用来存放数据的类

#import <Foundation/Foundation.h>

/**
 copy : NSString
 strong: 一般对象
 weak: UI控件
 assign:基本数据类型
 */

@interface MJApp : NSObject
/**
 *  名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;

/**
 *  通过字典来初始化模型对象
 *
 *  @param dict 字典对象
 *
 *  @return 已经初始化完毕的模型对象
 */
- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)appWithDict:(NSDictionary *)dict;
@end
