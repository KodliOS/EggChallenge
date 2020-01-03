//
//  HusamButton.swift
//  EggChallenge
//
//  Created by Hüsamettin  Eyibil on 2.01.2020.
//  Copyright © 2020 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit

class CustomButton : UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.purple : UIColor.lightGray
        }
    }
}
