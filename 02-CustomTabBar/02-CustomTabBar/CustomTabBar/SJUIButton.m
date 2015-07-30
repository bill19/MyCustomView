//
//  SJUIButton.m
//  02-CustomTabBar
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 SJ. All rights reserved.
//

#import "SJUIButton.h"

#define imageViewRatio 0.7f
#define titleLabelRatio 0.3f

@implementation SJUIButton

#pragma mark - initWithFrame方法，设置初始化一些只要设置一次的属性
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        //imageView和titleLabel居中
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //设置字体颜色和大小
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.titleLabel.font=[UIFont boldSystemFontOfSize:11];
        
    }
    return self;
}


#pragma mark - 重新设置image的rect
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWidth=self.bounds.size.width;
    CGFloat imageHeigh=self.bounds.size.height * imageViewRatio;
    CGFloat imageX=0;
    CGFloat imageY=0;
    return CGRectMake(imageX, imageY, imageWidth, imageHeigh);
}

#pragma mark - 重新设置titleLabel的rect
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleWidth=self.bounds.size.width;
    CGFloat titleHeigh=self.bounds.size.height * titleLabelRatio;
    CGFloat titleX=0;
    CGFloat titleY=self.bounds.size.height-titleHeigh;
    return CGRectMake(titleX, titleY, titleWidth, titleHeigh);
}

#pragma mark - item的set方法（设置属性）
-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    [self setTitle:item.title forState:UIControlStateNormal];
    
}


@end
