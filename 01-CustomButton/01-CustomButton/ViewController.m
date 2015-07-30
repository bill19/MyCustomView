//
//  ViewController.m
//  01-CustomButton
//
//  Created by qianfeng on 15-7-21.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import "ViewController.h"

#import "SJUIButton.h"
#import "WithNumButton.h"
#import "SJMessageButton.h"

@interface ViewController ()


@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor=[UIColor cyanColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self prepareMyCustomButton];
    [self prepareWithNumButton];
    [self prepareMessageButton];
    [self prepareImageButton];
}


#pragma mark - 准备“我的按钮”
-(void)prepareMyCustomButton
{
    SJUIButton * myButton=[[SJUIButton alloc]initWithFrame:CGRectMake(40, 200, 60    , 60)];
    
    //注：因为imageView和titleLabel是readOnly属性，所以，稚嫩读，不能写要通过另外的方法设置属性（set方法）
//    myButton.imageView.backgroundColor=[UIColor redColor];
//    myButton.titleLabel.backgroundColor=[UIColor grayColor];
    
//    [myButton setImage:[UIImage imageNamed:@"tb_handD"] forState:UIControlStateNormal];
//    [myButton setImage:[UIImage imageNamed:@"tb_handS"] forState:UIControlStateSelected];

//    [myButton setTitle:@"手工圈" forState:UIControlStateNormal];
    
    

    [myButton setTitle:@"手工圈" withTitleFont:[UIFont systemFontOfSize:12] withTitleColor:[UIColor grayColor] withSelectedTitleColor:[UIColor orangeColor]];
    
    [myButton setImage:[UIImage imageNamed:@"tb_handD"] selectedImage:[UIImage imageNamed:@"tb_handS"]];
    
    
//    myButton.selected=YES;
    
    [myButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:myButton];
}

#pragma mark - 准备WithNumButton类型的button
-(void)prepareWithNumButton
{
    WithNumButton * numButton=[[WithNumButton alloc]initWithFrame:CGRectMake(40, 300, 60, 60)];
    
    [numButton setTitle:@"实践" withTitleFont:[UIFont systemFontOfSize:12] withTitleColor:[UIColor grayColor] withSelectedTitleColor:[UIColor orangeColor]];
    [numButton setImage:[UIImage imageNamed:@"tb_teachD"] selectedImage:[UIImage imageNamed:@"tb_teachS"]];

    [numButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

    numButton.numString=@"8";
    
    
    [self.view addSubview:numButton];
    
}

#pragma mark - 准备MessageButton类型的button
-(void)prepareMessageButton
{
    SJMessageButton * messageRightButton=[[SJMessageButton alloc]init];
    
    [messageRightButton setMessage:@"hello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianyahello tianya" WithDirection:rightDirection];
    
    [messageRightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:messageRightButton];
    
    
    SJMessageButton * messageLeftButton=[[SJMessageButton alloc]init];
    
    [messageLeftButton setMessage:@"你好" WithDirection:leftDirection];
    
    [messageLeftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:messageLeftButton];
    
}


#pragma mark - 准备普通的图片按钮
-(void)prepareImageButton
{
    UIButton * button=[[UIButton alloc]init];
    button.frame=CGRectMake(40, 400, 60, 60);
    button.backgroundColor=[UIColor  whiteColor];
    [button setImage:[UIImage imageNamed:@"tb_handS"] forState:UIControlStateNormal];
    [self.view addSubview:button];

}

#pragma mark - button点击方法
-(void)buttonClick:(UIButton *)button
{
    button.selected=!button.selected;
}



@end
