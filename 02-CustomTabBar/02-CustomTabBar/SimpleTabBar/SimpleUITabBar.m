//
//  SimpleUITabBar.m
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import "SimpleUITabBar.h"
#import "SimpleUIButton.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width  //屏幕width
#define ScreenH [UIScreen mainScreen].bounds.size.height  //屏幕height
#define TabBarH 49.0f

@interface SimpleUITabBar ()

//记录选中的button
@property (nonatomic ,weak)SimpleUIButton * selectedButton;

@end


@implementation SimpleUITabBar

#pragma  mark - initWithFrame方法（赋初始的frame值）
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        //设置背景颜色
        self.backgroundColor=[UIColor whiteColor];
        
        //设置tabbar的frame（因为这种设置不应该是让外界设置的）
        CGFloat tabBarX=0;
        CGFloat tabBarW=ScreenW;
        CGFloat tabBarH=TabBarH;
        CGFloat tabBarY=ScreenH-tabBarH;
        self.frame=CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH);
        
    }
    return self;
}

#pragma mark - 增加按钮
-(void)addButtonWithItem:(UITabBarItem *)item
{
    SimpleUIButton * button=[[SimpleUIButton alloc]init];
    button.item=item;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    //默认第一个按钮选中
    if (self.subviews.count==1) {
        self.selectedButton=button;
        [self buttonClick:button];
    }
    
}

#pragma mark -button监听方法(实现代理方法)
-(void)buttonClick:(SimpleUIButton *)button
{
    //当delegate中定义了代理方法后调用代理方法
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonIndexFrom:toButtonIndex:)]) {
        [self.delegate tabBar:self didSelectedButtonIndexFrom:(int)self.selectedButton.tag toButtonIndex:(int)button.tag];
    }
    //设置当前选中的按钮属性
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
}


#pragma mark - 子视图布局方法（在view即将显示的时候会调用这个方法）
-(void)layoutSubviews
{
    for (int i=0; i<self.subviews.count; i++) {
        SimpleUIButton * button=(SimpleUIButton *)self.subviews[i];
        
        CGFloat buttonY=0;
        CGFloat buttonW=self.bounds.size.width/self.subviews.count;
        CGFloat buttonH=self.bounds.size.height;
        CGFloat buttonX=i*buttonW;
        //设置frame
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //设置tag值（方便调用对应的视图）
        button.tag=i;
    }
    
    //在第一次layoutSubviews的时候（因为每次滑动scrollView都会重新布局），默认选中第一个按钮
    //所以在布局完子视图之后，点击第一个按钮
    static int num=1;
    if (num==1) {
        [self buttonClick:self.subviews[0]];
        num++;
    }
    
}


@end
