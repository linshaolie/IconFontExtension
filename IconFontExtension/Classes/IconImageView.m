//
//  IconImageView.m
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/18.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import "IconImageView.h"
#import "UIImage+IconFont.h"
#import "IconInfo.h"
#import "IconFontMap.h"

@implementation IconImageView

- (void)setIconName:(NSString *)iconName {
    NSString *iName = IconNameSelector(iconName);
    if (!iName.length) {
        iName = iconName;
    }
    UIImage *image = [UIImage iconWithInfo:[IconInfo iconInfoWithText:iName size:CGRectGetWidth(self.frame) color:self.tintColor]];
    self.image = image;
}

@end
