//
//  MainView.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

import UIKit
import Clocket
import SnapKit

class MainView: UIView {
    private var layout = Layout()
    
    private var clock = Clock(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
    private var currentSegmentIndex = 0
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: EggType.items)
        segment.selectedSegmentIndex = 0
        segment.tintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        segment.selectedSegmentTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        segment.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        return segment
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "04:30"
        label.textAlignment = .center
        label.font = label.font.withSize(70)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        self.setGradient(color1: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), color2: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), startType: .vertical)
    }
    
    func setupView() {
        setupClock()
        setupSegmentedControl()
        setupTimeLabel()
    }
    
    private func setupClock() {
        addSubview(clock)
        clock.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(layout.clockMargins.top)
            make.height.width.equalTo(bounds.height / 4)
            make.centerX.equalToSuperview()
        }
        clock.start()
    }
    
    private func setupSegmentedControl() {
        addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(didChangedSegmentedControl(sender:)), for: .valueChanged)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(clock.snp.bottom).offset(layout.segmentedControlMargins.top)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupTimeLabel() {
        addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.height.equalTo(bounds.height / 4)
            make.width.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    func didChangedSegmentedControl(sender: UISegmentedControl) {
        currentSegmentIndex = sender.selectedSegmentIndex
        var timeString: String = ""
        if currentSegmentIndex == 0 {
            timeString = "04:30"
            clock.setTimer(type: .soft)
        } else if currentSegmentIndex == 1 {
            timeString = "05:00"
            clock.setTimer(type: .normal)
        } else if currentSegmentIndex == 2 {
            timeString = "06:30"
            clock.setTimer(type: .hard)
        }
        
        timeLabel.fadeOut { _ in
            self.timeLabel.text = timeString
            self.timeLabel.fadeIn(completion: nil)
        }
        clock.stop()
    }
    
    private struct Layout {
        let clockMargins = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
        let segmentedControlMargins = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
}
