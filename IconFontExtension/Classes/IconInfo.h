//
//  IconInfo.h
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/24.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface IconInfo : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, strong) UIColor *color;

+ (instancetype)iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;
- (instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color;

@end
