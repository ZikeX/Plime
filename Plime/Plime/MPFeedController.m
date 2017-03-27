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
#import "MPWaterflowLayout.h"
@interface MPFeedController ()<UICollectionViewDataSource>

@end

@implementation MPFeedController


static NSString * const MPArtId = @"art";

- (void)viewDidLoad {
    [super viewDidLoad];
    //  设置NavigationBar
    [self setupNavigationBar];
    //  设置WaterflowLayout
    [self setupWaterflowLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark .....:::::: 设置NavigationBar ::::::.....
- (void)setupNavigationBar
{
    UIColor *CharcoalColor = MPCharcoalColor;
    UIColor *PinkColor = MPPinkColor;
    //  设置左边的BarButtonItem
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [lButton setTitle:@"Search" forState:UIControlStateNormal];
    lButton.size = CGSizeMake(50, 30);
    lButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    lButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [lButton setTitleColor:PinkColor forState:UIControlStateNormal];
    [lButton setTitleColor:CharcoalColor forState:UIControlStateHighlighted];
    
    [lButton addTarget:self action:@selector(lButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lButton];
    
    //  设置右边的BarButtonItem
    UIButton *rButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rButton setTitle:@"History" forState:UIControlStateNormal];
    rButton.size = CGSizeMake(50, 30);
    rButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);

    [rButton setTitleColor:PinkColor forState:UIControlStateNormal];
    [rButton setTitleColor:CharcoalColor forState:UIControlStateHighlighted];
    
    [rButton addTarget:self action:@selector(rButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rButton];
    // 设置导航栏标签字体和颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24],NSForegroundColorAttributeName:PinkColor}];
}


-(void)lButtonClick
{
    UIStoryboard*MPSearch = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    UIViewController*MPSvc = [MPSearch instantiateViewControllerWithIdentifier:@"MPSearch"];
    [self presentViewController:MPSvc animated:YES completion:nil];
    MPLogFunc;
}


-(void)rButtonClick
{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = MPWhiteSmokeColor;
    [self.navigationController pushViewController:vc animated:YES];
    MPLogFunc;
}

#pragma mark .....:::::: 创建WaterflowLayout、注册 ::::::.....
- (void)setupWaterflowLayout
{
    //  创建布局
    MPWaterflowLayout *layout = [[MPWaterflowLayout alloc]init];
    //  创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    //  注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MPArtId];
}

#pragma mark .....:::::: UICollectionViewDataSource ::::::.....
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:MPArtId forIndexPath:indexPath];
    
    cell.backgroundColor = MPWhiteSmokeColor;
    
    NSInteger tag = 10;
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:tag];
    if (label == nil)
    {
        label = [[UILabel alloc]init];
        label.tag = tag;
        [cell.contentView addSubview:label];
    }
    label.text = [NSString stringWithFormat:@"%zd",indexPath.item];
    [label sizeToFit];
    //  设置CollectionViewCell为圆角
    cell.layer.cornerRadius = 10;
    
    return cell;
}

@end
