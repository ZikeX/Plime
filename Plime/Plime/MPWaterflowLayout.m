//
//  MPWaterflowLayout.m
//  Plime
//
//  Created by Maskmale on 17/3/24.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import "MPWaterflowLayout.h"

//  默认列数
static const NSInteger MPDefaultColimnCount = 2;
//  每一行之间的间距
static const CGFloat MPDefaultColimnMargin = 10;
//  每一列之间的间距
static const CGFloat MPDefaultRowMargin = 10;
//  边缘间距
static const UIEdgeInsets MPDefaultEdgeInsets = {10,10,10,10};


@interface MPWaterflowLayout()
//  存放所有的Cell的布局属性
@property (nonatomic, strong) NSMutableArray *attrsArray;
//  存放所有列的当前高度
@property (nonatomic, strong) NSMutableArray *columnHeights;

@end


@implementation MPWaterflowLayout

- (void) viewDidLoad
{

}

- (NSMutableArray *) columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *) attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

//初始化
-(void)prepareLayout
{
    [super prepareLayout];

    //  清楚之前计算的所有高度
    [self.columnHeights removeAllObjects];
    for (NSInteger i = 0; i < MPDefaultColimnCount; i++)
    {
        [self.columnHeights addObject:@(MPDefaultEdgeInsets.top)];
    }
    
    //  清楚之前所有的布局
    [self.attrsArray removeAllObjects];
    //  开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++)
    {
        //  创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //  获取indexPath位置的cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

//  决定cell的排布
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

//  返回indexPath位置cell对应的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //  创建布局属性
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //  CollectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    //  设置布局属性的frame
    CGFloat w = (collectionViewW - MPDefaultEdgeInsets.left - MPDefaultEdgeInsets.right - (MPDefaultColimnCount - 1) * MPDefaultColimnMargin) / MPDefaultColimnCount;
    CGFloat h = 40 + arc4random_uniform(100);
    //  找出高度最短的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < MPDefaultColimnCount; i++)
    {
        //  获取第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        
        if (minColumnHeight > columnHeight)
        {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = MPDefaultEdgeInsets.left + destColumn * (w + MPDefaultColimnMargin);
    CGFloat y = minColumnHeight;
    if (y != MPDefaultEdgeInsets.top)
    {
        y += MPDefaultRowMargin;
    }
    attrs.frame = CGRectMake(x, y, w, h);
    
    
    //  更新最短的那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    return attrs;
}

-(CGSize)collectionViewContentSize
{
    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < MPDefaultColimnCount; i++)
    {
        //  获取第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        
        if (maxColumnHeight > columnHeight)
        {
            maxColumnHeight = columnHeight;
        }
    }
    return  CGSizeMake(0, maxColumnHeight + MPDefaultEdgeInsets.bottom);
}
@end



















