//
//  SJUITabBarController.h
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

/*利用系统的tabbar（继承自uiTabBarController）自定义tabbar的一种形式*/

#import <UIKit/UIKit.h>

@interface SJUITabBarController : UITabBarController

-(void)addViewController:(UIViewController *)viewController withTitle:(NSString *)title withImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage;

@end
