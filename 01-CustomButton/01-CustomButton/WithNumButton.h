//
//  WithNumButton.h
//  01-CustomButton
//
//  Created by qianfeng on 15-7-21.
//  Copyright (c) 2015年 lix. All rights reserved.
//

/*带有数字的定制按钮（右上角会有数字显示，上边是imageView，下边是titleLabel）*/


#import <UIKit/UIKit.h>

@interface WithNumButton : UIButton

//要显示的数字（通过它的值，设置numButton）
@property (nonatomic ,copy)NSString  * numString;

//设置image和selectedImage
-(void)setImage:(UIImage *)image selectedImage:(UIImage *)selectedImage;


//设置titleColor和selectedTitleColor
-(void)setTitle:(NSString *)title withTitleFont:(UIFont *)titleFont withTitleColor:(UIColor *)titleColor withSelectedTitleColor:(UIColor *)selectedTitleColor;

@end
