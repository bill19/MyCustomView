//
//  ScrollUITabBar.h
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollUITabBar;

@protocol ScrollUITabBarDelegate <NSObject>

-(void)tabBar:(ScrollUITabBar *)tabBar didSelectedFromButtonIndex:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex;

@end



@interface ScrollUITabBar : UIScrollView

//设置代理属性
@property (nonatomic ,weak)id<ScrollUITabBarDelegate,UIScrollViewDelegate> delegate;

//通过item添加一个按钮
-(void)addScrollButtonWithItem:(UITabBarItem *)item;

@end
