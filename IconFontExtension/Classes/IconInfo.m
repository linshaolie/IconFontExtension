//
//  IconInfo.m
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/24.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import "IconInfo.h"
#import "IconFontMap.h"

@implementation IconInfo

- (instancetype)initWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    if (self = [super init]) {
        self.text = iconUnicodeWithName(text);
        self.size = size;
        self.color = color;
    }
    return self;
}

+ (instancetype)iconInfoWithText:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    return [[IconInfo alloc] initWithText:text size:size color:color];
}

@end
