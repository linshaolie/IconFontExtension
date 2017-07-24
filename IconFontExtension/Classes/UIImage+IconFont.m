//
//  UIImage+IconFont.m
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/24.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import "UIImage+IconFont.h"
#import "IconFontMap.h"

@implementation UIImage (IconFont)

+ (UIImage *)iconWithInfo:(IconInfo *)info {
    CGFloat size = info.size;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    UIFont *font = IconFontWithSize(realSize);
    UIGraphicsBeginImageContext(CGSizeMake(realSize, realSize));
    
    [info.text drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: info.color}];
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    return image;
}

@end
