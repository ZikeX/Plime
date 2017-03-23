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

#define MPGlobalBg MPRGBClor(245, 245, 245)
#define MPTitleColor MPRGBClor(245, 245, 245)

#endif /* PrefixHeader_h */
