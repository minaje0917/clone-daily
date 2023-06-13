//
//  Dailycalender.swift
//  daily
//
//  Created by 선민재 on 2022/11/19.
//

import UIKit
import FSCalendar
import RxFlow

extension HomeViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance  {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        let selectDate = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        selectDate.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date))
        self.navigationItem.backButton(title: dateFormatter.string(from: date))
        viewModel.pushDailyVC(date: selectDate.string(from: date), content: "")
    }
}
