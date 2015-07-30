//
//  SimpleUITabBarController.h
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

/*
 
 通过viewController创建一个tabbbarController
 这种方法与CustomTabBar的区别：
 （1）CustomTabBar中增添的是viewController
 （2）SimpleTabBar中增添的是view
 
 */



#import <UIKit/UIKit.h>

@interface SimpleUITabBarController : UIViewController

//一个一个添加视图（因为image和selectedImage也要对应的添加）（如果一下添加一个视图控制器数组，这样不能很好的添加相应的image和selectedImage）
-(void)addView:(UIView *)view withTitle:(NSString *)title withImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage;

@end
