//
//  UIView+Animation.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit

extension UIView {
    func fadeIn(completion: ((_:Bool) -> Void)?) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 5,
            options: .curveEaseOut,
            animations: {
                self.transform = .identity
        },
            completion: completion
        )
    }
    
    func fadeOut(completion: ((_:Bool) -> Void)?) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 5,
            options: .curveEaseIn,
            animations: {
                self.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        },
            completion: completion
        )
    }
}
