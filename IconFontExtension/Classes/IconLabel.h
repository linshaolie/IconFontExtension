//
//  IconLabel.h
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/18.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface IconLabel : UILabel

/// 设置选中状态
@property(nonatomic, assign) BOOL selected;

/// 普通状态下的图片名称（只需要后面的4位 16 进制， 如：f3f7)
@property(nonatomic, copy, nullable) IBInspectable NSString *iconName;

/// 普通状态下的颜色(如果不设置则取 textColor)
@property(nonatomic, strong, nullable) IBInspectable UIColor *normalColor;

/// 被选中状态下的图片名称（只需要后面的4位 16 进制，如：f3f7)
@property(nonatomic, copy, nullable) IBInspectable NSString *selectedIconName;

/// 被选中状态下的颜色(如果不设置则取 textColor)
@property(nonatomic, strong, nullable) IBInspectable UIColor *selectedColor;

/// 图标字体，默认为： 宏：IconFontName， 如果是其他图标字体可自行设置
@property(nonatomic, copy, nullable) IBInspectable NSString *fontName;

/// 图标大小
@property(nonatomic, assign) CGFloat fontSize;

- (instancetype)initWithIconName:(NSString *)iconName fontSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
