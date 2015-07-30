//
//  SJUITabBar.m
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import "SJUITabBar.h"



@interface SJUITabBar ()

//记录选中的button
@property (nonatomic ,weak)SJUIButton * selectedButton;

@end


@implementation SJUITabBar

#pragma mark - 增加button（默认选中第一个按钮）
-(void)addButtonWithTabBarItem:(UITabBarItem *)item
{
    SJUIButton * button=[[SJUIButton alloc]init];
    button.item=item;
    
    //增减button点击事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    //默认选中第一个按钮
    if (self.subviews.count==1) {
        [self buttonClick:button];
    }
}

#pragma mark - button点击事件
-(void)buttonClick:(SJUIButton *)button
{
    //当代理遵守协议后，才进行花括号里面的运算
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    //将选中按钮的“选中”属性设置为No，button的设置属性设置为Yes，并且将button设置为selectedButton
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
}


#pragma mark  -  layoutSubviews子视图布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW=self.bounds.size.width/self.subviews.count;
    CGFloat buttonH=self.bounds.size.height;
    CGFloat buttonY=0;
    
    for (int i=0; i<self.subviews.count; i++) {
        SJUIButton * button = self.subviews[i];
        CGFloat buttonX=i*buttonW;
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //设置tag值，方便后面的点击事件（调用不同的视图）
        button.tag=i;
    }
}

@end
