//
//  WithNumButton.m
//  01-CustomButton
//
//  Created by qianfeng on 15-7-21.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import "WithNumButton.h"

#define imageRatio 0.7  // image所占高度于整个button的比例
#define titleRatio 0.3  // titleLabel所占高度于整个button的比例

#define NumTitleFont [UIFont boldSystemFontOfSize:15]   //numButton中的字体格式

//#define NumTitleFont [UIFont systemFontOfSize:15] 

#define NumButtonPadding 3.0f  //numButton的内间距

#define NumImage [UIImage imageNamed:@"point"]   //数字背景图片

@interface WithNumButton ()

//数字按钮（要想在一个button的右上角添加一个显示红色数字的区域，这个区域实际上也是一个button）
@property (nonatomic ,weak)UIButton * numButton;

@end



@implementation WithNumButton

//注：只有在initWithFrame方法中才可以设置imageView他们居中（并且显示原图大小），在init方法中不能实现（不会调用）！！！
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor whiteColor];
        
        //设置imageView和titleLabel居中（并且显示原图大小）
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        //创建一个button的时候，num默认是0
        self.numString=@"0";
        
        //创建一个显示数字的button
        UIButton * numButton=[[UIButton alloc]init];
        [self addSubview:numButton];
        _numButton=numButton;
        
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

#pragma mark - numString的set方法（显示数字）
-(void)setNumString:(NSString *)numString
{
    _numString=numString;
    
    //当num＝0的时候，不显示numButton(隐藏)
    if ([_numString isEqualToString:@"0"]) {
        self.numButton.hidden=YES;
    }
    //当num不是0的时候，显示numButton(不隐藏)
    else
    {
        self.numButton.hidden=NO;
        
        self.numButton.titleLabel.font=NumTitleFont;
        
        //计算数字需要的size
        CGSize  numSize=[numString boundingRectWithSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:NumTitleFont} context:nil].size;
        
        //计算numButton的frame
        
        //当只有一位数（显示整个背景）
        if (numString.length==1) {
            CGFloat numButtonW=NumImage.size.width+NumButtonPadding*2;
            CGFloat numButtonH=NumImage.size.height+NumButtonPadding*2;
            CGFloat numButtonY=0;
            CGFloat numButtonX=self.bounds.size.width-numButtonW;
            self.numButton.frame=CGRectMake(numButtonX,numButtonY,numButtonW,numButtonH);
            self.numButton.contentEdgeInsets=UIEdgeInsetsMake(NumButtonPadding,NumButtonPadding,NumButtonPadding,NumButtonPadding);
            
            //设置背景
            [self.numButton setBackgroundImage:NumImage forState:UIControlStateNormal];
        }
        //当有多位数字的时候
        else{
            CGFloat numButtonW=numSize.width+2*NumButtonPadding;
            CGFloat numButtonH=numSize.height;
            CGFloat numButtonY=0;
            CGFloat numButtonX=self.bounds.size.width-numButtonW;
            self.numButton.frame=CGRectMake(numButtonX,numButtonY,numButtonW,numButtonH);
            self.numButton.contentEdgeInsets=UIEdgeInsetsMake(NumButtonPadding,0,NumButtonPadding,0);
            
            //设置背景
            UIImage * newImage=[NumImage resizableImageWithCapInsets:UIEdgeInsetsMake(NumImage.size.width/2, NumImage.size.height/2, NumImage.size.width/2, NumImage.size.height/2)];
            [self.numButton setBackgroundImage:newImage forState:UIControlStateNormal];
        }
        
        [self.numButton setTitle:self.numString forState:UIControlStateNormal];
        
    }
    
    
}


@end
