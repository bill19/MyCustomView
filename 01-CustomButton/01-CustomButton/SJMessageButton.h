//
//  SJMessageButton.h
//  01-CustomButton
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 lix. All rights reserved.
//

/*消息按钮*/

#import <UIKit/UIKit.h>

//按钮的方向
typedef enum
{
    leftDirection,
    rightDirection
}ButtonDirection;


@interface SJMessageButton : UIButton

//通过方向判断button的方向（button的类型）
@property (nonatomic ,assign)ButtonDirection buttonDirection;

//信息（通过它的set方法，生成一个显示消息的button（有短信背景））
@property (nonatomic ,copy)NSString * message;


-(void)setMessage:(NSString *)message WithDirection:(ButtonDirection)buttonDirection;

@end
