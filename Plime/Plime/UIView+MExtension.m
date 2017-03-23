//
//  UIView+MExtension.m
//  Plime
//
//  Created by Maskmale on 17/3/23.
//  Copyright © 2017年 Maskmale. All rights reserved.
//

#import "UIView+MExtension.h"

@implementation UIView (MExtension)

-(void)setSize:(CGSize)size
{
    CGRect  fram = self.frame;
    fram.size = size;
    self.frame = fram;
}

-(void)setWidth:(CGFloat)width
{
    CGRect  fram = self.frame;
    fram.size.width = width;
    self.frame = fram;
}

-(void)setHeight:(CGFloat)height
{
    CGRect  fram = self.frame;
    fram.size.height = height;
    self.frame = fram;
}

-(void)setX:(CGFloat)x
{
    CGRect  fram = self.frame;
    fram.origin.x = x;
    self.frame = fram;
}

-(void)setY:(CGFloat)y
{
    CGRect  fram = self.frame;
    fram.origin.y = y;
    self.frame = fram;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

@end

