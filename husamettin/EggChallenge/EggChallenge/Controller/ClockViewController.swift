//
//  ClockViewController.swift
//  EggChallenge
//
//  Created by Hüsamettin  Eyibil on 2.01.2020.
//  Copyright © 2020 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit
import Clocket

enum clockState {
    case isWorking
    case isStopped
}


class ClockViewController: UIViewController {
    
    var senderTag = 0
    var boilTime = (0, 0)
    @IBOutlet weak var clock: Clocket!
    @IBOutlet weak var startButton: CustomButton!
    var clockState : clockState = .isStopped
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClock()
        
        clock.clockDelegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    private func setupClock() {
        switch senderTag {
        case 0:
            boilTime = (4,30)
        case 1:
            boilTime = (6,30)
        case 2:
            boilTime = (8,30)
        default:
            print("Unexpected value for senderTag.")
        }
        
        
        clock.countDownTimer = true
        clock.displayRealTime = false
        clock.setLocalTime(hour: 0, minute: boilTime.0, second: boilTime.1)
        clock.reverseTime = true
        clock.isUserInteractionEnabled = false
        
        startButton.setTitle("Start Timer", for: .normal)
        
    }
    
    @IBAction func startButtonTapped(_ sender: CustomButton) {
        if clockState == .isStopped {
            clock.startClock()
            startButton.setTitle("Pause Timer", for: .normal)
            clockState = .isWorking
        } else {
            clock.stopClock()
            startButton.setTitle("Start Timer", for: .normal)
            clockState = .isStopped
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: CustomButton) {
        //clock.stopClock()
        setupClock()
        
        startButton.isHidden = false
        startButton.isEnabled = true
    }
    
}

extension ClockViewController : ClocketDelegate {
    func timeIsSetManually() {
        
    }
    
    func clockStopped() {
        clockState = .isStopped
    }
    
    func countDownExpired() {
        SweetAlert().showAlert("Enjoy your meal!", subTitle: "Your eggs are ready.", style: .success, buttonTitle: "OK")
        startButton.isHidden = true
        startButton.isEnabled = false
    }
    
    
}


