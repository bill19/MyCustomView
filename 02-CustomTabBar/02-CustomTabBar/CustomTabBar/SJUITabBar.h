//
//  SJUITabBar.h
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJUITabBar.h"
#import "SJUIButton.h"

@class SJUITabBar;

@protocol SJUITabBarDelegate <NSObject>

//从哪个按钮（tag标记）到哪个按钮
-(void)tabBar:(SJUITabBar *)tabBar didSelectedButtonFrom:(int)fromIndex to:(int)toIndex;

@end


@interface SJUITabBar : UIView


//设置代理
@property (nonatomic ,weak)id<SJUITabBarDelegate>delegate;

//添加button的方法
-(void)addButtonWithTabBarItem:(UITabBarItem *)item;

@end
