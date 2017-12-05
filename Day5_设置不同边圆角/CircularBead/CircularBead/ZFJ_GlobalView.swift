//
//  ZFJ_GlobalView.swift
//  ZFJDemoSwift
//
//  Created by ZFJ on 2016/11/15.
//  Copyright © 2016年 ZFJ. All rights reserved.
//

import Foundation
import UIKit

enum GlobalViewType : NSInteger {
    
    case ZFJ_GlobalViewNormal             //没有圆角
    case ZFJ_GlobalViewAllFillet          //全部圆角
    case ZFJ_GlobalViewTopFillet          //上部圆角
    case ZFJ_GlobalViewDownFillet         //下部圆角
    case ZFJ_GlobalViewLeftFillet         //左部圆角
    case ZFJ_GlobalViewRightFillet        //右部圆角
    case ZFJ_GlobalViewLeftTopFillet      //左上圆角
    case ZFJ_GlobalViewRightTopFillet     //右上圆角
    case ZFJ_GlobalViewLeftDownNormal     //左下圆角
    case ZFJ_GlobalViewRightDownFillet    //左下圆角
    
}

extension UIView{
    
    func setZFJGlobalView(viewType : GlobalViewType,cornerRadius : CGFloat){
        switch viewType {
        case .ZFJ_GlobalViewNormal:
            
            break
        case .ZFJ_GlobalViewAllFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        case .ZFJ_GlobalViewTopFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [UIRectCorner.topLeft , UIRectCorner.topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        case .ZFJ_GlobalViewDownFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [UIRectCorner.bottomLeft , UIRectCorner.bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            maskLayer.strokeColor = UIColor.black.cgColor
            maskLayer.lineWidth = 1.0
            
            self.layer.mask = maskLayer

            break
        case .ZFJ_GlobalViewLeftFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [UIRectCorner.bottomLeft , UIRectCorner.topLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        case .ZFJ_GlobalViewRightFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [UIRectCorner.bottomRight , UIRectCorner.topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        case .ZFJ_GlobalViewLeftTopFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: UIRectCorner.topLeft, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        case .ZFJ_GlobalViewRightTopFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: UIRectCorner.topRight, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        case .ZFJ_GlobalViewLeftDownNormal:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: UIRectCorner.bottomLeft, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        case .ZFJ_GlobalViewRightDownFillet:
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: UIRectCorner.bottomRight, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            break
        }
    }
    
}
