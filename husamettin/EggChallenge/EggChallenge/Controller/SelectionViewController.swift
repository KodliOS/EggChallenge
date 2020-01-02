//
//  ViewController.swift
//  EggChallenge
//
//  Created by Hüsamettin  Eyibil on 13.12.2019.
//  Copyright © 2019 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ClockViewController") as! ClockViewController
        vc.senderTag = sender.tag
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.purple : UIColor.lightGray
        }
    }
}



