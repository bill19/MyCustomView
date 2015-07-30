//
//  ScrollUITabBarController.h
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollUITabBarController : UIViewController

//添加视图控制器（并且添加对应的image和title）
-(void)addViewController:(UIViewController *)viewController withTitle:(NSString *)title withImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage;

@end
