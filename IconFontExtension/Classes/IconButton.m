//
//  IconButton.m
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/18.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import "IconButton.h"
#import "IconFontMap.h"

IB_DESIGNABLE

@implementation IconButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initFont];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    
    [self initFont];
}

+ (instancetype)buttonWithIconName:(NSString *)iconName color:(UIColor *)color {
    return [[IconButton alloc] initWithIcon:iconName color:color];
}

- (instancetype)initWithIcon:(NSString *)icon color:(UIColor *)color {
    return [self initWithIcon:icon color:color selectedIcon:nil selectedColor:nil];
}

- (instancetype)initWithIcon:(NSString *)icon color:(UIColor *)color selectedIcon:(NSString *)selectedIcon selectedColor:(UIColor *)selectedColor {
    self = [super init];
    if (self) {
        [self initFont];
        self.iconName = icon;
        [self setTitle:self.iconName forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        
        if (selectedIcon) {
            self.selectedIconName = selectedIcon;
            [self setTitle:self.selectedIconName forState:UIControlStateSelected];
        }
        if (selectedColor) {
            [self setTitleColor:selectedColor forState:UIControlStateSelected];
        }
    }
    return self;
}

- (void)initFont {
    CGFloat fontSize = self.titleLabel.font.pointSize;
    if (_fontName) {
        self.titleLabel.font = [UIFont fontWithName:_fontName size:fontSize];
    } else {
        self.titleLabel.font = [UIFont fontWithName:IconFontName size:fontSize];
    }
}

#pragma mark - setter and getter
- (void)setIconName:(NSString *)iconName {
    NSString *iName = IconNameSelector(iconName);
    if (!iName.length) {
        iName = iconUnicodeWithName(iconName);
    } else {
        iName = iconUnicodeWithName(iName);
    }
    if (iName != _iconName) {
        _iconName = iName;
        [self setTitle:_iconName forState:UIControlStateNormal];
    }
}

- (void)setSelectedIconName:(NSString *)selectedIconName {
    NSString *iName = IconNameSelector(selectedIconName);
    if (!iName.length) {
        iName = iconUnicodeWithName(selectedIconName);
    } else {
        iName = iconUnicodeWithName(iName);
    }
    if (iName != _selectedIconName) {
        _selectedIconName = iName;
        [self setTitle:_selectedIconName forState:UIControlStateSelected];
    }
}

- (void)setDisableIconName:(NSString *)disableIconName {
    NSString *iName = IconNameSelector(disableIconName);
    if (!iName.length) {
        iName = iconUnicodeWithName(disableIconName);
    } else {
        iName = iconUnicodeWithName(iName);
    }
    if (iName != _disableIconName) {
        _disableIconName = iName;
        [self setTitle:_disableIconName forState:UIControlStateDisabled];
    }
}

- (void)setSize:(CGFloat)size {
    if (_size != size) {
        _size = size;
        self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.fontName size:size];
    }
}
@end
