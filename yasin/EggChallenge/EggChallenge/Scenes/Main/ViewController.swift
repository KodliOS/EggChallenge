//
//  ViewController.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 12.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        super.loadView()
        view = MainView(frame: view.bounds)
    }
}

