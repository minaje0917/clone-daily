//
//  DailyNavigation.swift
//  daily
//
//  Created by 선민재 on 2022/11/18.
//

import UIKit
import Then

extension UINavigationItem {
    func backButton(title:String = "취소") {
        let backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = UIColor.black
        self.backBarButtonItem = backBarButtonItem
    }
    
    func addRightBarButtonItem() {
        let editButton = UIBarButtonItem().then {
            $0.image = UIImage(named: "EditButton.svg")?.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .n10
        }
        
        let deleteButton = UIBarButtonItem().then {
            $0.image = UIImage(named: "DeleteButton.svg")?.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .error
        }
        self.setRightBarButtonItems([deleteButton,editButton], animated: true)
    }
}
