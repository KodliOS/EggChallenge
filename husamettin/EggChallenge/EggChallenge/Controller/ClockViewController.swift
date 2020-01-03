//
//  ClockViewController.swift
//  EggChallenge
//
//  Created by Hüsamettin  Eyibil on 2.01.2020.
//  Copyright © 2020 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit
import Clocket

class ClockViewController: UIViewController {
    
    var senderTag = 0
    @IBOutlet weak var clock: Clocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clock.displayRealTime = true
        clock.startClock()
        

        // Do any additional setup after loading the view.
    }
    

   

}
