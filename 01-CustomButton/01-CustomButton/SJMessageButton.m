//
//  SJMessageButton.m
//  01-CustomButton
//
//  Created by qianfeng on 15-7-22.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import "SJMessageButton.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define PaddingX 8.0f
#define PaddingY 8.0f

//背景图片
#define NormalLeftBgImage [UIImage imageNamed:@"message_left_nor"]
#define HighLightedLeftBgImage [UIImage imageNamed:@"message_left_press_pic"]

#define NormalRightBgImage [UIImage imageNamed:@"message_right_nor"]
#define HighLightedRightBgImage [UIImage imageNamed:@"message_right_press_pic"]

@implementation SJMessageButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        //折行模式
        self.titleLabel.numberOfLines=0;
        
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        
        //内间距（是图片的width和height的一半）
        self.contentEdgeInsets=UIEdgeInsetsMake(NormalLeftBgImage.size.width/2, NormalLeftBgImage.size.height/2, NormalLeftBgImage.size.width/2, NormalLeftBgImage.size.height/2);
    }
    return self;
}


#pragma mark - 消息按钮message的set方法
-(void)setMessage:(NSString *)message WithDirection:(ButtonDirection)buttonDirection
{
    _message=message;
    _buttonDirection=buttonDirection;
    
    //消息size计算
    CGSize messageSize=[message boundingRectWithSize:CGSizeMake(ScreenW/2-NormalLeftBgImage.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    
    //button的frame和背景图片和字体颜色
    
    //判断方向：
    if (buttonDirection==leftDirection) {
        CGFloat buttonX=PaddingX;
        CGFloat buttonY=PaddingY;
        CGFloat buttonW=messageSize.width+NormalLeftBgImage.size.width;
        CGFloat buttonH=messageSize.height+NormalLeftBgImage.size.height;
        
        self.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        UIImage * newNormalImage=[NormalLeftBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(NormalLeftBgImage.size.width/2, NormalLeftBgImage.size.height/2, NormalLeftBgImage.size.width/2, NormalLeftBgImage.size.height/2)];
        [self setBackgroundImage:newNormalImage forState:UIControlStateNormal];
        
        UIImage * newHighLightedImage=[HighLightedLeftBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(HighLightedLeftBgImage.size.width/2, HighLightedLeftBgImage.size.height/2, HighLightedLeftBgImage.size.width/2, HighLightedLeftBgImage.size.height/2)];
        [self setBackgroundImage:newHighLightedImage forState:UIControlStateHighlighted];
        
        //设置字体颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        
    }
    else if (buttonDirection==rightDirection) {
        CGFloat buttonW=messageSize.width+NormalLeftBgImage.size.width;
        CGFloat buttonH=messageSize.height+NormalLeftBgImage.size.height;
        CGFloat buttonX=ScreenW-buttonW-PaddingX;
        CGFloat buttonY=PaddingY;
        
        self.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        UIImage * newNormalImage=[NormalRightBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(NormalRightBgImage.size.width/2, NormalRightBgImage.size.height/2, NormalRightBgImage.size.width/2, NormalRightBgImage.size.height/2)];
        [self setBackgroundImage:newNormalImage forState:UIControlStateNormal];
        
        UIImage * newHighLightedImage=[HighLightedRightBgImage resizableImageWithCapInsets:UIEdgeInsetsMake(HighLightedRightBgImage.size.width/2, HighLightedRightBgImage.size.height/2, HighLightedRightBgImage.size.width/2, HighLightedRightBgImage.size.height/2)];
        [self setBackgroundImage:newHighLightedImage forState:UIControlStateHighlighted];
        
        //设置字体颜色
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    
    //设置文字
    [self setTitle:message forState:UIControlStateNormal];
   
}


@end
