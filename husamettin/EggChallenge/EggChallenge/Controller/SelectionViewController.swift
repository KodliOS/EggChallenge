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
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    }

    @IBAction func selectButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ClockViewController") as! ClockViewController
        vc.senderTag = sender.tag
        self.navigationController?.pushViewController(vc, animated: true)
//        show(ClockViewController(), sender: self)
    }
    
    
}

//extension UIButton {
//    override open var isHighlighted: Bool {
//        didSet {
//            backgroundColor = isHighlighted ? UIColor.purple : UIColor.lightGray
//        }
//    }
//}



