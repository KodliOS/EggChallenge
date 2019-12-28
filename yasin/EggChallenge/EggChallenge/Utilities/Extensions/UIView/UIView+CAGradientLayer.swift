//
//  UIView+CAGradientLayer.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit

extension UIView {
    public enum GradientLayerType {
        case horizontal,vertical,crossFromLeftTop,crossFromRightTop
    }
    
    public func setGradient(color1: UIColor, color2: UIColor, startType type: GradientLayerType) {
        let gradient = CAGradientLayer()
        gradient.locations = [0.0,1.0]
        switch type {
        case .horizontal:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .vertical:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .crossFromLeftTop:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .crossFromRightTop:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        }
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
}
