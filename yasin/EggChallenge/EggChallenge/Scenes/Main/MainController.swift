//
//  MainView.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit

final class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = MainView(frame: view.bounds)
    }
}

extension MainController: MainViewDelegate {
    func mainView(_ mainView: MainView, didTapStartButton button: UIButton) { }
    func mainView(_ mainView: MainView, didSegmentValueChanged segmentControl: UISegmentedControl) { }
}
