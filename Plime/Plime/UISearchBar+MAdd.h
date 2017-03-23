//
//  UISearchBar+MAdd.h
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (MAdd)

- (void)m_setTextFont:(UIFont *)font;
- (void)m_setTextColor:(UIColor *)textColor;
- (void)m_setCancelButtonTitle:(NSString *)title;
/**
 *  设置取消按钮字体
 *
 *  @param font 字体
 */
- (void)m_setCancelButtonFont:(UIFont *)font;
@end
