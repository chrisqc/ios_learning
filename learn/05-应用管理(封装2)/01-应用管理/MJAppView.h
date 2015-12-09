//
//  MJAppView.h
//  01-应用管理
//
//  Created by apple on 14-3-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJApp;

@interface MJAppView : UIView

/**
 *  模型数据
 */
@property (nonatomic, strong) MJApp *app;

+ (instancetype)appView;

/**
 *  通过模型数据来创建一个view
 */
+ (instancetype)appViewWithApp:(MJApp *)app;

@end
