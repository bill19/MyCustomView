//
//  SJUIButton.h
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJUIButton : UIButton

//通过这个属性，设置button子控件（imageView，titleLabel）属性
@property (nonatomic ,weak)UITabBarItem * item;

@end
