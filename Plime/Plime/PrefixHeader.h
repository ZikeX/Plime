//
//  PrefixHeader.h
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h

#import "UIView+MExtension.h"

#ifdef DEBUG
#define MPLog(...)  NSLog(__VA_ARGS__)
#else
#define MPLog(...)
#endif

#define MPLogFunc  MPLog(@"%s", __func__)

#define MPRGBClor(r, g, b)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0];

//Global背景颜色、标题、未选择的 TabBarItem 文字、图标颜色
#define MPWhiteSmokeColor MPRGBClor(245, 245, 245)
//已选择 TabBarItem 文字、图标，未点击的按钮文字、图标颜色
#define MPPinkColor MPRGBClor(234,76,137)
//NavigationBar 、TabBar背景颜色，内容文字（作品名称，作者，点击量等）的颜色
#define MPCharcoalColor MPRGBClor(51,51,51)
//团队、组合等的文字颜色
#define MPTeamsColor MPRGBClor(0,182,227)

#endif /* PrefixHeader_h */
