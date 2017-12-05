//
//  UIView+ZFJ_GlobalView.m
//  ZFJDemo
//
//  Created by ZFJ on 2016/11/15.
//  Copyright © 2016年 ZFJ. All rights reserved.
//

#import "UIView+ZFJ_GlobalView.h"

@implementation UIView (ZFJ_GlobalView)

/// 注意：使用该方法要在设置控件的frame之后
- (void)setZFJGlobalViewWith:(GlobalViewType)viewType cornerRadius:(CGFloat)cornerRadius{
    switch (viewType) {
        case ZFJ_GlobalViewNormal:{
            //没有改变
        }
            break;
        case ZFJ_GlobalViewAllFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewTopFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewDownFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewLeftFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewRightFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewLeftTopFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewRightTopFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewLeftDownNormal:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        case ZFJ_GlobalViewRightDownFillet:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
            break;
        default:
            break;
    }
}

@end
