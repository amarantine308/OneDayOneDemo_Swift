//
//  UIView+ZFJ_GlobalView.h
//  ZFJDemo
//
//  Created by ZFJ on 2016/11/15.
//  Copyright © 2016年 ZFJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GlobalViewType) {
    ZFJ_GlobalViewNormal,           //没有圆角
    ZFJ_GlobalViewAllFillet,        //全部圆角
    ZFJ_GlobalViewTopFillet,        //上部圆角
    ZFJ_GlobalViewDownFillet,       //下部圆角
    ZFJ_GlobalViewLeftFillet,       //左部圆角
    ZFJ_GlobalViewRightFillet,      //右部圆角
    ZFJ_GlobalViewLeftTopFillet,    //左上圆角
    ZFJ_GlobalViewRightTopFillet,   //右上圆角
    ZFJ_GlobalViewLeftDownNormal,   //左下圆角
    ZFJ_GlobalViewRightDownFillet   //左下圆角
};


@interface UIView (ZFJ_GlobalView)

//- (id)initWithFrame:(CGRect)frame viewType:(GlobalViewType)viewType;

/// 注意：使用该方法要在设置控件的frame之后
- (void)setZFJGlobalViewWith:(GlobalViewType)viewType cornerRadius:(CGFloat)cornerRadius;

@end


