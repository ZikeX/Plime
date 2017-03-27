//
//  MPNavigationController.m
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import "MPNavigationController.h"

@interface MPNavigationController ()

@end

@implementation MPNavigationController

+(void)initialize{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"MP_NavBar_bg"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *title = [NSMutableDictionary dictionary];
    
    title [NSForegroundColorAttributeName] = MPCharcoalColor;
    [bar setTitleTextAttributes:title];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [lButton setTitle:@"< 返回" forState:UIControlStateNormal];
        //  设置按钮图片
//        [lButton setImage:[UIImage imageNamed:@"imageName"] forState:UIControlStateNormal];
//        [lButton setImage:[UIImage imageNamed:@"imageName_prs"] forState:UIControlStateHighlighted];
        //  设置按钮尺寸
        UIColor *CharcoalColor = MPCharcoalColor;
        UIColor *PinkColor = MPPinkColor;
        lButton.size = CGSizeMake(70, 30);
        lButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        lButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        [lButton setTitleColor:PinkColor forState:UIControlStateNormal];
        [lButton setTitleColor:CharcoalColor forState:UIControlStateHighlighted];
        [lButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:lButton];
        //  隐藏TabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //  这句super的push要在后面，让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

#pragma mark .....:::::: back ::::::.....
- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
