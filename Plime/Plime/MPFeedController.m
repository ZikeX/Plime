//
//  MPFeedController.m
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import "MPFeedController.h"
#import "MPNavigationController.h"
#import "UIView+MExtension.h"
@interface MPFeedController ()

@end

@implementation MPFeedController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  设置NavigationBar
    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark .....:::::: 设置NavigationBar ::::::.....
- (void)setupNavigationBar
{
    //  设置左边的BarButtonItem
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [lButton setTitle:@"Search" forState:UIControlStateNormal];
    lButton.size = CGSizeMake(50, 30);
//    UIColor *TitleColor = MPTitleColor;
    lButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    lButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [lButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [lButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [lButton addTarget:self action:@selector(lButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    
    //  设置右边的BarButtonItem
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rButton setTitle:@"History" forState:UIControlStateNormal];
    rButton.size = CGSizeMake(50, 30);
    rButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    [rButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [rButton addTarget:self action:@selector(rButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    // 设置导航栏标签字体和颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

#pragma mark .....:::::: lButton ::::::.....
-(void)lButtonClick
{
    UIStoryboard*MPSearch = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    UIViewController*MPSvc = [MPSearch instantiateViewControllerWithIdentifier:@"MPSearch"];
    [self presentViewController:MPSvc animated:YES completion:nil];
    MPLogFunc;
}

#pragma mark .....:::::: rButton ::::::.....
-(void)rButtonClick
{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = MPGlobalBg;
    [self.navigationController pushViewController:vc animated:YES];
    MPLogFunc;
}
@end
