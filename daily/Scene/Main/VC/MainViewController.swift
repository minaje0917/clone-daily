//
//  MainViewController.swift
//  daily
//
//  Created by 선민재 on 2022/11/11.
//

import UIKit
import Then
import SnapKit

class MainViewController: BaseViewController<MainViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isToolbarHidden = false
        self.navigationItem.hidesBackButton = true
        toolbar()
    }
    
    func toolbar() {
        let showDaily =  UIBarButtonItem(title: "일기보기", style: .plain, target:self, action: nil)
        let showProfile = UIBarButtonItem(title: "프로필보기", style: .plain, target: self, action: nil)
        let showRoom = UIBarButtonItem(title: "구경하기", style: .plain, target: self, action: nil)
        var items = [UIBarButtonItem]()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)

        [showDaily,flexibleSpace,showProfile,flexibleSpace,showRoom].forEach {
            items.append($0)
        }
        self.toolbarItems = items
        toolbarItems = [showDaily,flexibleSpace,showProfile,flexibleSpace,showRoom]
    }
    
    override func addView() {
        [].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        
    }
    
}
