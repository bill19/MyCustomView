//
//  SimpleUITabBar.h
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleUITabBar;

//定义代理
@protocol SimpleUITabBarDelegate <NSObject>

-(void)tabBar:(SimpleUITabBar *)tabBar didSelectedButtonIndexFrom:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex;

@end



@interface SimpleUITabBar : UIView

//设置代理属性
@property (nonatomic ,weak)id<SimpleUITabBarDelegate>delegate;

//通过item增加一个按钮
-(void)addButtonWithItem:(UITabBarItem *)item;

@end
