//
//  SimpleUITabBarController.m
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import "SimpleUITabBarController.h"
#import "SimpleUITabBar.h"

@interface SimpleUITabBarController ()<SimpleUITabBarDelegate>

//保存视图的数组
@property (nonatomic ,retain)NSMutableArray * viewsArray;

//自定义tabbar
@property (nonatomic ,weak)SimpleUITabBar * customTabBar;

@end

@implementation SimpleUITabBarController

#pragma mark - init方法（创建可变数组viewsArray,创建tabbar）
-(instancetype)init
{
    if (self=[super init]) {
        
        _viewsArray=[[NSMutableArray alloc]init];
        
        [self setCustomTabBar];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - viewWillAppear方法（显示第一个view，后将customTabbar提到最前面）
-(void)viewWillAppear:(BOOL)animated
{

}

#pragma mark - view的增加方法(创建按钮)
-(void)addView:(UIView *)view withTitle:(NSString *)title withImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage
{
    //方便添加按钮
    UITabBarItem * item=[[UITabBarItem alloc]init];
    item.title=title;
    item.image=image;
    item.selectedImage=selectedImage;
    
    //将视图添加到视图数组中
    [_viewsArray addObject:view];
    
    [self.view addSubview:view];
    
    //给tabbar添加按钮
    [self.customTabBar addButtonWithItem:item];
}

#pragma mark - 设置(创建)自定义tabbar
-(void)setCustomTabBar
{
    if (_customTabBar==nil) {
        SimpleUITabBar * customTabBar=[[SimpleUITabBar alloc]init];
        [self.view addSubview:customTabBar];
        //设置代理
        customTabBar.delegate=self;
        _customTabBar=customTabBar;
    }
}

#pragma mark - SimpleUITabBarDelegate代理方法
-(void)tabBar:(SimpleUITabBar *)tabBar didSelectedButtonIndexFrom:(int)fromButtonIndex toButtonIndex:(int)toButtonIndex
{
    [self.view bringSubviewToFront:self.viewsArray[toButtonIndex]];
    //将自定义的tabbar提到最前面
    [self.view bringSubviewToFront:self.customTabBar];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
