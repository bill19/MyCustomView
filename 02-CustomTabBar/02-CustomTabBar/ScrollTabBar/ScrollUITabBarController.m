//
//  ScrollUITabBarController.m
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import "ScrollUITabBarController.h"
#import "ScrollUITabBar.h"

@interface ScrollUITabBarController ()<ScrollUITabBarDelegate,UIScrollViewDelegate>

//存储视图控制器
@property (nonatomic ,retain)NSMutableArray * viewControllersArray;

//存储视图控制器上对应的view
@property (nonatomic ,retain)NSMutableArray * viewsArray;

//自定义的滚动tabbar
@property (nonatomic ,weak)ScrollUITabBar * scrollTabBar;

@end

@implementation ScrollUITabBarController

#pragma mark - viewDidLoad方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - viewWillAppear方法
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.view bringSubviewToFront:self.scrollTabBar];
}


#pragma mark - init方法
-(instancetype)init
{
    if (self=[super init]) {
        
        //创建array
        _viewControllersArray=[[NSMutableArray alloc]init];
        _viewsArray=[[NSMutableArray alloc]init];
        
        //创建tabbar
        [self setScrollTabBar];
        
    }
    return self;
}



#pragma mark - 添加视图控制器方法
-(void)addViewController:(UIViewController *)viewController withTitle:(NSString *)title withImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage
{
    //创建item（方便传值创建按钮）
    UITabBarItem * item=[[UITabBarItem alloc]init];
    item.title=title;
    item.image=image;
    item.selectedImage=selectedImage;
    
    [_viewControllersArray addObject:viewController];
    [_viewsArray addObject:viewController.view];
    
    [self.view addSubview:viewController.view];
    
    [self.scrollTabBar addScrollButtonWithItem:item];
}


#pragma mark - 创建tabbar
-(void)setScrollTabBar
{
    if (_scrollTabBar==nil) {
        ScrollUITabBar * scrollTabBar=[[ScrollUITabBar alloc]init];
        //设置代理
        scrollTabBar.delegate=self;
        [self.view addSubview:scrollTabBar];
        _scrollTabBar=scrollTabBar;
    }
}

#pragma mark - ScrollUITabBarDelegate代理方法
-(void)tabBar:(ScrollUITabBar *)tabBar didSelectedFromButtonIndex:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex
{
    [self.view bringSubviewToFront:self.viewsArray[toButtonIndex]];
    [self.view bringSubviewToFront:self.scrollTabBar];
}



#pragma mark - 内存紧张
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
