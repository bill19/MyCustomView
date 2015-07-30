//
//  SJUIButton.h
//  01-CustomButton
//
//  Created by qianfeng on 15-7-21.
//  Copyright (c) 2015年 lix. All rights reserved.
//

/*普通的定制按钮（上边是imageView 下边是titleLabel）*/

#import <UIKit/UIKit.h>

@interface SJUIButton : UIButton

//设置image和selectedImage
-(void)setImage:(UIImage *)image selectedImage:(UIImage *)selectedImage;


//设置titleColor和selectedTitleColor
-(void)setTitle:(NSString *)title withTitleFont:(UIFont *)titleFont withTitleColor:(UIColor *)titleColor withSelectedTitleColor:(UIColor *)selectedTitleColor;

@end
