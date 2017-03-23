//
//  UISearchBar+MAdd.m
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import "UISearchBar+MAdd.h"

#define IS_IOS9 [[UIDevice currentDevice].systemVersion doubleValue] >= 9

@implementation UISearchBar (MAdd)

- (void)m_setTextFont:(UIFont *)font {
    if (IS_IOS9) {
        [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].font = font;
    }else {
        [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setFont:font];
    }
}

- (void)m_setTextColor:(UIColor *)textColor {
    if (IS_IOS9) {
        [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].textColor = textColor;
    }else {
        [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:textColor];
    }
}

- (void)m_setCancelButtonTitle:(NSString *)title {
    if (IS_IOS9) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:title];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:title];
    }
}

- (void)m_setCancelButtonFont:(UIFont *)font {
    NSDictionary *textAttr = @{NSFontAttributeName : font};
    if (IS_IOS9) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }
}

@end
