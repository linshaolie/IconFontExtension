//
//  IconLabel.m
//  YueYunPengPlayer
//
//  Created by shaolie on 2017/7/18.
//  Copyright © 2017年 shaolie. All rights reserved.
//

#import "IconLabel.h"
#import <CoreText/CoreText.h>
#import "IconFontMap.h"

@implementation IconLabel

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *fontURL = [[NSBundle mainBundle] URLForResource:@"iconfont" withExtension:@"ttf"];
        CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)fontURL);
        CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
        CGDataProviderRelease(fontDataProvider);
        CTFontManagerRegisterGraphicsFont(newFont, nil);
        CGFontRelease(newFont);
    });
}

- (instancetype)initWithIconName:(NSString *)iconName fontSize:(CGFloat)fontSize {
    self = [super init];
    if (self) {
        [self initFontWithSize:fontSize];
        
        self.iconName = iconName;
        self.text = _selected ? _selectedIconName : _iconName;
        [self sizeToFit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initFontWithSize:self.font.pointSize];
    self.text = _selected ? _selectedIconName : _iconName;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    
    [self initFontWithSize:self.font.pointSize];
    self.text = _selected ? _selectedIconName : _iconName;
}

- (void)initFontWithSize:(CGFloat)fontSize {
    if (_fontName) {
        self.font = [UIFont fontWithName:_fontName size:fontSize];
    } else {
        self.font = [UIFont fontWithName:IconFontName size:fontSize];
    }
}

#pragma mark - setter and getter

- (void)setIconName:(NSString *)iconName {
    NSString *iName = IconNameSelector(iconName);
    if (iName.length) {
        iName = iconUnicodeWithName(iName);
    } else {
        iName = iconUnicodeWithName(iconName);
    }
    if (iName != _iconName) {
        _iconName = iName;
    }
}

- (void)setSelectedIconName:(NSString *)selectedIconName {
    NSString *iName = IconNameSelector(selectedIconName);
    if (iName.length) {
        iName = iconUnicodeWithName(iName);
    } else {
        iName = iconUnicodeWithName(selectedIconName);
    }
    if (iName != _selectedIconName) {
        _selectedIconName = iName;
    }
}

- (void)setSelected:(BOOL)selected {
    if (selected != _selected) {
        _selected = selected;
        
        [self reloadView];
    }
}

- (void)setNormalColor:(UIColor *)normalColor {
    if (_normalColor != normalColor) {
        _normalColor = normalColor;
        
        [self reloadView];
    }
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    if (_selectedColor != selectedColor) {
        _selectedColor = selectedColor;
        
        [self reloadView];
    }
}

- (void)setFontSize:(CGFloat)fontSize {
    if (_fontSize != fontSize) {
        _fontSize = fontSize;
        [self initFontWithSize:fontSize];
    }
}

- (void)reloadView {
    self.text = _selected ? _selectedIconName : _iconName;
    if (_selected && _selectedColor) {
        self.textColor = _selectedColor;
    } else {
        self.textColor = _normalColor;
    }
}

@end
