//
//  ViewController.m
//  IconFontExtension
//
//  Created by shaolie on 2017/7/23.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import "ViewController.h"
#import "IconLabel.h"
#import "IconButton.h"
#import "IconImageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *tips = [[UILabel alloc] init];
    tips.text = @"这是用代码实现的：";
    tips.frame = CGRectMake(40, 360, 0, 0);
    [tips sizeToFit];
    [self.view addSubview:tips];
    
    IconLabel *iconLabel = [[IconLabel alloc] initWithIconName:@"灯泡" fontSize:30];
    iconLabel.frame = CGRectMake(100, 400, iconLabel.frame.size.width, iconLabel.frame.size.height);
    [self.view addSubview:iconLabel];
    
    IconButton *iconBtn = [[IconButton alloc] initWithIcon:@"空红心" color:[UIColor yellowColor] selectedIcon:@"实红心" selectedColor:[UIColor redColor]];
    iconBtn.frame = CGRectMake(160, 400, 40, 40);
    [iconBtn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    iconBtn.size = 30;
    [self.view addSubview:iconBtn];
    
    IconImageView *imageView = [[IconImageView alloc] initWithImage:[UIImage iconWithInfo:[IconInfo iconInfoWithText:@"back" size:24 color:[UIColor blackColor]]]];
    imageView.frame = CGRectMake(220, 400, 30, 30);
    [self.view addSubview:imageView];
    
    IconImageView *imageView2 = [[IconImageView alloc] init];
    imageView2.tintColor = [UIColor purpleColor];
    imageView2.frame = CGRectMake(260, 400, 30, 30);
    imageView2.iconName = @"灯泡";
    [self.view addSubview:imageView2];
}

- (void)touchBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
}

@end
