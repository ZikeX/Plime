//
//  MPTabBarController.m
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import "MPTabBarController.h"

@interface MPTabBarController ()

@end

@implementation MPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  通过 appearance 统一设置 UITabBarController 文字属性
    //  常态
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs [NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs [NSForegroundColorAttributeName] = MPCharcoalColor;
    //  选中
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs [NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs [NSForegroundColorAttributeName] = MPPinkColor;
    //  赋值
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
