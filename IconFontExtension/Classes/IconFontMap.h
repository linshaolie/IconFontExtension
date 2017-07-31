//
//  IconFontMap.h
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/20.
//  Copyright © 2017年 shaolie. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

#ifndef IconFontMap_h
#define IconFontMap_h

#warning Replace your font name
#define IconFontName @"my_like_icon"

#define IconFontWithSize(s) [UIFont fontWithName:IconFontName size:s]

//TODO: 如果 IconFontMap 路径变量，会导致 SRCROOT 改变（占时没有想到其他方法）
#define SRCROOT [[NSString stringWithCString:__FILE__ encoding:(NSUTF8StringEncoding)] stringByReplacingOccurrencesOfString:@"Classes/IconFontMap.h" withString:@""]

#define IconNameSelector(key) iconfontWithName(key)


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"

static NSString * _Nullable iconfontWithName(NSString * __nonnull name) {
    static NSDictionary *iconFontMap = nil;
#if DEBUG && TARGET_OS_SIMULATOR
    NSString *fullPath = [SRCROOT stringByAppendingString:@"IconFontMap.plist"];
    iconFontMap = [NSDictionary dictionaryWithContentsOfFile:fullPath];
#endif
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#warning read icon map file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"IconFontMap" ofType:@"plist"];
        iconFontMap = [NSDictionary dictionaryWithContentsOfFile:path];
    });
    return iconFontMap[name];
}

/// 根据16进制字符串获取 Unicode 字符
static NSString *iconUnicodeWithName(NSString *name) {
    NSScanner *scanner = [NSScanner scannerWithString:name];
    unsigned int code;
    [scanner scanHexInt:&code];
    return [NSString stringWithFormat:@"%C", (unsigned short)code];
}

#pragma clang diagnostic pop
#endif /* IconFontMap_h */

NS_ASSUME_NONNULL_END
