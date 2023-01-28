//
//  MainViewController.swift
//  daily
//
//  Created by 선민재 on 2022/11/11.
//

import UIKit
import Then
import SnapKit
import FSCalendar

class MainViewController: BaseViewController<MainViewModel> {
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        calender.delegate = self
        calender.dataSource = self
    }
    
    let calender = FSCalendar(frame: .zero).then {
        $0.locale = Locale(identifier: "ko_KR")
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        $0.appearance.todayColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        $0.appearance.headerTitleColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        $0.appearance.weekdayTextColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        $0.appearance.headerDateFormat = "YYYY년 M월"
        $0.calendarWeekdayView.weekdayLabels[0].text = "S"
        $0.calendarWeekdayView.weekdayLabels[1].text = "M"
        $0.calendarWeekdayView.weekdayLabels[2].text = "T"
        $0.calendarWeekdayView.weekdayLabels[3].text = "W"
        $0.calendarWeekdayView.weekdayLabels[4].text = "T"
        $0.calendarWeekdayView.weekdayLabels[5].text = "F"
        $0.calendarWeekdayView.weekdayLabels[6].text = "S"
    }
    
    let springBackground = UIImageView().then{
        $0.image = UIImage(named: "Spring.svg")
    }
    
    let underView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var dailyButton = UIButton().then {
        $0.setImage(UIImage(systemName: "book"), for: .normal)
        let text = NSAttributedString(string: "일기보기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
        $0.alignTextBelow(spacing: 3.5)
    }
    
    lazy var profileButton = UIButton().then {
        $0.setImage(UIImage(systemName: "person"), for: .normal)
        $0.tintColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        let text = NSAttributedString(string: "프로필보기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.setTitleColor(UIColor(red: 149/255, green: 149/255, blue: 149/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
        $0.alignTextBelow(spacing: 3.5)
    }
    
    lazy var roomButton = UIButton().then {
        $0.setImage(UIImage(systemName: "binoculars"), for: .normal)
        $0.tintColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        let text = NSAttributedString(string: "구경하기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.setTitleColor(UIColor(red: 149/255, green: 149/255, blue: 149/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
        $0.alignTextBelow(spacing: 3.5)
    }
    
    let toolBarLine = UIView().then {
        $0.backgroundColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1.0)
    }
    
    @objc func handleCalender() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
//        selectText.text = dateFormatter.string(from: calender.date)
        print(calender.date)
    }

    override func addView() {
        [springBackground,dailyButton,profileButton,roomButton,toolBarLine,underView,calender].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        dailyButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo((bounds.width) / 3)
            $0.leading.equalTo(view.snp.leading).offset(0)
            $0.bottom.equalTo(view.snp.bottom).inset((bounds.height) / 30)
        }
        profileButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo((bounds.width) / 3)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).inset((bounds.height) / 30)
        }
        roomButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo((bounds.width) / 3)
            $0.trailing.equalTo(view.snp.trailing).inset(0)
            $0.bottom.equalTo(view.snp.bottom).inset((bounds.height) / 30)
        }
        toolBarLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(0)
            $0.bottom.equalTo(roomButton.snp.top).offset(0)
        }
        underView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.top.equalTo(roomButton.snp.bottom).offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
        springBackground.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(0)
            $0.leading.trailing.equalToSuperview().inset(0)
        }
        calender.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(14)
            $0.top.bottom.equalToSuperview().inset(226)
            $0.centerX.equalToSuperview()
        }
    }
    
}
