//
//  SJUITabBarController.m
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import "SJUITabBarController.h"
#import "SJUITabBar.h"

@interface SJUITabBarController ()<SJUITabBarDelegate>

//自定义的tabbar
@property (nonatomic ,weak) SJUITabBar * customTabBar;

@end

@implementation SJUITabBarController

#pragma mark - viewDidLoad(set自定义tabbar)
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setCustomTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - viewWillAppear(将系统生成的tarbarBtn删除)
//将原先系统tabbar中的tabbarItem删除
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView * childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[UIControl class]]) {
            [childView removeFromSuperview];
        }
    }
}


#pragma mark - 增添视图控制器（参数：title，image，selectedImage）
//（可以是导航控制器，因为导航控制器是继承自UIViewController）
-(void)addViewController:(UIViewController *)viewController withTitle:(NSString *)title withImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage
{
    UITabBarItem * item=[[UITabBarItem alloc]init];
    item.title=title;
    item.image=image;
    item.selectedImage=selectedImage;
    
    //可能在外界并不会设置title值，最好是自己设置一下（这样，如果是navigation的话，会显示title）
    viewController.title=title;
    
    //将视图添加到tabbar的Controller上
    [self addChildViewController:viewController];
    
    //没添加一个视图的时候，添加相应的按钮
    [self.customTabBar addButtonWithTabBarItem:item];
    
}


#pragma mark - 设置自定的tabbar
-(void)setCustomTabBar
{
    if (_customTabBar==nil) {
        SJUITabBar * customTabBar=[[SJUITabBar alloc]init];
        customTabBar.frame=self.tabBar.bounds;
        
//        NSLog(@"tabbarFrame:%@",NSStringFromCGRect(self.tabBar.bounds));
        
        //设置代理
        customTabBar.delegate=self;
        
        //将自定义的tabbar（实际上就是一个view），添加到系统的tabbar上
        [self.tabBar addSubview:customTabBar];
        _customTabBar=customTabBar;
    }
}

#pragma mark - 实现SJUITabBarDelegate代理方法
-(void)tabBar:(SJUITabBar *)tabBar didSelectedButtonFrom:(int)fromIndex to:(int)toIndex
{
    //选中的index为toIndex（根据点击的哪个按钮，跳至对应的视图）
    self.selectedIndex=toIndex;
}



@end
