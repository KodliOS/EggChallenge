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

public protocol MainViewDelegate: class {
    func mainView(_ mainView: MainView, didTapStartButton button: UIButton)
    func mainView(_ mainView: MainView, didSegmentValueChanged segmentControl: UISegmentedControl)
}

// TODO: Add Progress Bar
// TODO: Add Reset/Clear Button
public final class MainView: UIView {
    var delegate: MainViewDelegate?
    
    private var layout = Layout()
    private var clock = Clock(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    private var angle = CGFloat.pi * 2
    private var currentSegmentIndex = 0
    private var isBoil = false
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: EggType.items)
        segment.selectedSegmentIndex = 0
        segment.tintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        segment.selectedSegmentTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        segment.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        segment.layer.borderColor = UIColor.black.cgColor
        segment.layer.borderWidth = 1
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
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(70)
        button.titleLabel?.textColor = .white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.addTarget(self, action: #selector(startButtonClicked(_:)), for: .touchUpInside)
        return button
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
    
    private func setupView() {
        setupClock()
        setupSegmentedControl()
        setupTimeLabel()
        setupStartButton()
    }
    
    private func setupClock() {
        addSubview(clock)
        clock.setTimer(type: .soft)
        clock.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(layout.clockMargins.top)
            make.height.width.equalTo(bounds.height / 4)
            make.centerX.equalToSuperview()
        }
        clock.stop()
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
    
    private func setupStartButton() {
        addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(25)
            make.height.equalTo(bounds.height / 8)
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
        timeLabel.fade(type: .out) { _ in
            self.timeLabel.text = timeString
            self.timeLabel.fade(type: .identity, completion: nil)
        }
        clock.stop()
        delegate?.mainView(self, didSegmentValueChanged: sender)
    }
    
    @objc
    func startButtonClicked(_ sender: UIButton) {
        segmentedControl.isHidden = isBoil
        timeLabel.isHidden = isBoil
        if isBoil == false {
            startButton.shake { _ in
                self.startButton.backgroundColor = .red
                self.startButton.setTitle("Boil ?", for: .normal)
                self.isBoil = true
                self.clock.stop()
            }
        } else {
            self.startButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            self.startButton.setTitle("Waiting", for: .normal)
            clock.start()
            isBoil = !isBoil
        }
        delegate?.mainView(self, didTapStartButton: sender)
    }
    
    private struct Layout {
        let clockMargins = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
        let segmentedControlMargins = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
}
