//
//  AppDelegate.m
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import "AppDelegate.h"
#import "SJUITabBarController.h"
#import "SimpleUITabBarController.h"
#import "ScrollUITabBarController.h"

@interface AppDelegate ()
{
    SJUITabBarController * _tabBarController;
    SimpleUITabBarController * _simpleTabBarController;
    ScrollUITabBarController * _scrollTabBarController;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
 
    
//    [self prepareCustomTabBar];
    
//    [self prepareSimpleTabBar];
    
    [self prepareScrollTabBar];
    
    self.window.rootViewController=_scrollTabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - 准备自定义的tabbar
-(void)prepareCustomTabBar
{
    //discover视图
    UIViewController * discoverVC=[[UIViewController alloc]init];
    discoverVC.title=@"discover";
    discoverVC.view.backgroundColor=[UIColor cyanColor];
    UINavigationController * discoverNav=[[UINavigationController alloc]initWithRootViewController:discoverVC];
    
    //handGroup视图
    UIViewController * handGroupVC=[[UIViewController alloc]init];
    handGroupVC.title=@"handGroup";
    handGroupVC.view.backgroundColor=[UIColor greenColor];
    UINavigationController * handGroupNav=[[UINavigationController alloc]initWithRootViewController:handGroupVC];
    
    //course视图
    UIViewController * courseVC=[[UIViewController alloc]init];
    courseVC.title=@"course";
    courseVC.view.backgroundColor=[UIColor grayColor];
    UINavigationController * courseNav=[[UINavigationController alloc]initWithRootViewController:courseVC];
    
    //person视图
    UIViewController * personVC=[[UIViewController alloc]init];
    personVC.title=@"person";
    personVC.view.backgroundColor=[UIColor yellowColor];
    UINavigationController * personNav=[[UINavigationController alloc]initWithRootViewController:personVC];
    
    //添加到tabBar中
//    _tabBarController.viewControllers=@[discoverNav,handGroupNav,courseNav,personNav];
    
    _tabBarController=[[SJUITabBarController alloc]init];
    
    [_tabBarController addViewController:discoverNav withTitle:@"发现" withImage:[UIImage imageNamed:@"tb_findD"] withSelectedImage:[UIImage imageNamed:@"tb_findS"]];
    [_tabBarController addViewController:handGroupNav withTitle:@"手工圈" withImage:[UIImage imageNamed:@"tb_handD"] withSelectedImage:[UIImage imageNamed:@"tb_handS"]];
    [_tabBarController addViewController:courseNav  withTitle:@"教程" withImage:[UIImage imageNamed:@"tb_teachD"] withSelectedImage:[UIImage imageNamed:@"tb_teachS"]];
    [_tabBarController addViewController:personNav withTitle:@"个人中心" withImage:[UIImage imageNamed:@"tb_perD"] withSelectedImage:[UIImage imageNamed:@"tb_perS"]];
}


#pragma mark - 准备simpleTabBar
-(void)prepareSimpleTabBar
{
    //discover视图
    UIView * discoverView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    discoverView.backgroundColor=[UIColor greenColor];
    
    //handGroup视图
    UIView * handGroupView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    handGroupView.backgroundColor=[UIColor cyanColor];
    
    //course视图
    UIView * courseView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    courseView.backgroundColor=[UIColor yellowColor];
    
    //person视图
    UIView * personView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    personView.backgroundColor=[UIColor whiteColor];
    
    //添加到tabBar中
    
    _simpleTabBarController=[[SimpleUITabBarController alloc]init];
    _simpleTabBarController.view.backgroundColor=[UIColor whiteColor];
    
    [_simpleTabBarController addView:discoverView withTitle:@"发现" withImage:[UIImage imageNamed:@"tb_findD"] withSelectedImage:[UIImage imageNamed:@"tb_findS"]];
    [_simpleTabBarController addView:handGroupView withTitle:@"手工圈" withImage:[UIImage imageNamed:@"tb_handD"] withSelectedImage:[UIImage imageNamed:@"tb_handS"]];
    [_simpleTabBarController addView:courseView  withTitle:@"教程" withImage:[UIImage imageNamed:@"tb_teachD"] withSelectedImage:[UIImage imageNamed:@"tb_teachS"]];
    [_simpleTabBarController addView:personView withTitle:@"个人中心" withImage:[UIImage imageNamed:@"tb_perD"] withSelectedImage:[UIImage imageNamed:@"tb_perS"]];
}


#pragma mark - 准备scrollTarbar
-(void)prepareScrollTabBar
{
    //discover视图
    UIViewController * discoverVC=[[UIViewController alloc]init];
    discoverVC.title=@"discover";
    discoverVC.view.backgroundColor=[UIColor cyanColor];
    UINavigationController * discoverNav=[[UINavigationController alloc]initWithRootViewController:discoverVC];
    
    //handGroup视图
    UIViewController * handGroupVC=[[UIViewController alloc]init];
    handGroupVC.title=@"handGroup";
    handGroupVC.view.backgroundColor=[UIColor greenColor];
    UINavigationController * handGroupNav=[[UINavigationController alloc]initWithRootViewController:handGroupVC];
    
    //course视图
    UIViewController * courseVC=[[UIViewController alloc]init];
    courseVC.title=@"course";
    courseVC.view.backgroundColor=[UIColor grayColor];
    UINavigationController * courseNav=[[UINavigationController alloc]initWithRootViewController:courseVC];
    
    //person视图
    UIViewController * personVC=[[UIViewController alloc]init];
    personVC.title=@"person";
    personVC.view.backgroundColor=[UIColor yellowColor];
    UINavigationController * personNav=[[UINavigationController alloc]initWithRootViewController:personVC];
    
    //添加到tabBar中
   
    
    _scrollTabBarController=[[ScrollUITabBarController alloc]init];
    
    [_scrollTabBarController addViewController:discoverNav withTitle:@"发现" withImage:[UIImage imageNamed:@"tb_findD"] withSelectedImage:[UIImage imageNamed:@"tb_findS"]];
    [_scrollTabBarController addViewController:handGroupNav withTitle:@"手工圈" withImage:[UIImage imageNamed:@"tb_handD"] withSelectedImage:[UIImage imageNamed:@"tb_handS"]];
    [_scrollTabBarController addViewController:courseNav  withTitle:@"教程" withImage:[UIImage imageNamed:@"tb_teachD"] withSelectedImage:[UIImage imageNamed:@"tb_teachS"]];
    [_scrollTabBarController addViewController:personNav withTitle:@"个人中心" withImage:[UIImage imageNamed:@"tb_perD"] withSelectedImage:[UIImage imageNamed:@"tb_perS"]];
    
    //第二次添加
    [_scrollTabBarController addViewController:discoverNav withTitle:@"发现" withImage:[UIImage imageNamed:@"tb_findD"] withSelectedImage:[UIImage imageNamed:@"tb_findS"]];
    [_scrollTabBarController addViewController:handGroupNav withTitle:@"手工圈" withImage:[UIImage imageNamed:@"tb_handD"] withSelectedImage:[UIImage imageNamed:@"tb_handS"]];
    [_scrollTabBarController addViewController:courseNav  withTitle:@"教程" withImage:[UIImage imageNamed:@"tb_teachD"] withSelectedImage:[UIImage imageNamed:@"tb_teachS"]];
    [_scrollTabBarController addViewController:personNav withTitle:@"个人中心" withImage:[UIImage imageNamed:@"tb_perD"] withSelectedImage:[UIImage imageNamed:@"tb_perS"]];
    
}






- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
