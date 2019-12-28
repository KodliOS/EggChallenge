//
//  CustomClock.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit
import Clocket

public final class Clock: UIView {
    
    private var clock = Clocket(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    private func setupAppearance() {
        addSubview(clock)
        clock.isUserInteractionEnabled = false
        clock.countDownTimer = true
        clock.displayRealTime = true
        clock.manualTimeSetAllowed = false
        clock.reverseTime = true
        clock.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        clock.startClock()
    }
    
    public func start() {
        stop()
        clock.startClock()
    }
    
    public func stop() {
        clock.stopClock()
    }
    
    public func showRealTime() {
        clock.countDownTimer = false
        clock.displayRealTime = true
        start()
    }
    
    public func setTimer(type: EggType) {
        switch type {
        case .soft:
            setCountDown(hour: 0, minute: 4, second: 30)
        case .normal:
            setCountDown(hour: 0, minute: 5, second: 0)
        case .hard:
            setCountDown(hour: 0, minute: 6, second: 30)
        }
    }
    
    private func setCountDown(hour: Int, minute: Int, second: Int) {
        clock.displayRealTime = false
        clock.setLocalTime(hour: hour, minute: minute, second: second)
        start()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
