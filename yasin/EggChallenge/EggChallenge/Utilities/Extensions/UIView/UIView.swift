//
//  UIView.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
