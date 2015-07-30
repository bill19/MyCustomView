//
//  SJUIButton.m
//  01-CustomButton
//
//  Created by qianfeng on 15-7-21.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import "SJUIButton.h"

#define imageRatio 0.7  // image所占高度于整个button的比例
#define titleRatio 0.3  // titleLabel所占高度于整个button的比例

@implementation SJUIButton


//注：只有在initWithFrame方法中才可以设置imageView他们居中（并且显示原图大小），在init方法中不能实现（不会调用）！！！
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor whiteColor];
        
        //设置imageView和titleLabel居中（并且显示原图大小）
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    return self;
}


#pragma mark - 重写image的content的尺寸
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWidth=self.bounds.size.width;
    CGFloat imageHeight=self.bounds.size.height * imageRatio;
    return CGRectMake(0, 0, imageWidth, imageHeight);
}

#pragma mark - 重写title的content尺寸
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleWidth=self.bounds.size.width;
    CGFloat titleHeight=self.bounds.size.height * titleRatio;
    CGFloat titleY=self.bounds.size.height - titleHeight;
    return CGRectMake(0,titleY , titleWidth, titleHeight);
}

#pragma mark - 设置image和selectedImage
-(void)setImage:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:selectedImage forState:UIControlStateSelected];
}


#pragma mark - 设置title,titleFont, titleColor ,selectedTitleColor
-(void)setTitle:(NSString *)title withTitleFont:(UIFont *)titleFont withTitleColor:(UIColor *)titleColor withSelectedTitleColor:(UIColor *)selectedTitleColor
{
    [self setTitle:title forState:UIControlStateNormal];
    self.titleLabel.font=titleFont;
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
}

@end
