//
//  UIView+Animation.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit

extension UIView {
    
    public enum FadeType {
        case `in`,out,identity
    }
    
    public func fade(type: FadeType, completion: ((_:Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 25,
            options: .curveLinear,
            animations: {
                switch type {
                case .in:
                    self.transform = CGAffineTransform(scaleX: 15, y: 15)
                case .out:
                    self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                case .identity:
                    self.transform = .identity
                }
        },
            completion: completion
        )
    }
    
    public func shake(completion: ((_:Bool) -> Void)? = nil) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
        if let completion = completion {
            completion(true)
        }
    }
}
