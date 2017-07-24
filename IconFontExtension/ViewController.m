//
//  ViewController.m
//  IconFontExtension
//
//  Created by shaolie on 2017/7/23.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import "ViewController.h"
#import "IconLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 灯泡
    _iconLabel.text = @"\U0000e881";
    
    IconLabel *iconLabel = [[IconLabel alloc] initWithIconName:@"灯泡" fontSize:30];
    iconLabel.frame = CGRectMake(100, 100, iconLabel.frame.size.width, iconLabel.frame.size.height);
    [self.view addSubview:iconLabel];
}

@end
