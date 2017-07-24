//
//  IconButton.h
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/18.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IconButton : UIButton

/// 普通状态下的图片名称（只需要后面的4位 16 进制， 如：f3f7)
@property(nonatomic, copy, nullable) IBInspectable NSString *iconName;

/// 被选中状态下的图片名称（只需要后面的4位 16 进制，如：f3f7)
@property(nonatomic, copy, nullable) IBInspectable NSString *selectedIconName;

/// disable 状态下的图片名称（只需要后面的4位 16 进制，如：f3f7)
@property(nonatomic, copy, nullable) IBInspectable NSString *disableIconName;

/// 图标字体，默认为： 宏：IconFontName， 如果是其他图标字体可自行设置
@property(nonatomic, copy, nullable) IBInspectable NSString *fontName;

/// 图标大小
@property(nonatomic, assign) CGFloat size;

+ (instancetype)buttonWithIconName:(NSString *)iconName color:(UIColor *)color;
- (instancetype)initWithIcon:(NSString *)icon color:(UIColor *)color;
- (instancetype)initWithIcon:(NSString *)icon color:(UIColor *)color selectedIcon:(NSString * __nullable)selectedIcon selectedColor:(UIColor * __nullable)selectedColor;

@end

NS_ASSUME_NONNULL_END
