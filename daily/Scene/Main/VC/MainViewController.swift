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
//        self.navigationController?.isToolbarHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
//    lazy var showDailyButton = UIButton().then {
//        $0.setImage(UIImage(systemName: "book"), for: .normal)
//        let text = NSAttributedString(string: "일기보기")
//        $0.setAttributedTitle(text, for: .normal)
//        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
//        $0.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
//    }
    
//    func toolbar() {
//        var showDaily =  UIBarButtonItem(customView: showDailyButton)
//        let showProfile = UIBarButtonItem(title: "프로필보기", style: .plain, target: self, action: nil)
//        let showRoom = UIBarButtonItem(title: "구경하기", style: .plain, target: self, action: nil)
//        var items = [UIBarButtonItem]()
//        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//
//        [showDaily,flexibleSpace,showProfile,flexibleSpace,showRoom].forEach {
//            items.append($0)
//        }
//        self.toolbarItems = items
//        toolbarItems = [showDaily,flexibleSpace,showProfile,flexibleSpace,showRoom]
//    }
    
    
    lazy var dailyButton = UIButton().then {
        $0.setImage(UIImage(systemName: "book"), for: .normal)
        let text = NSAttributedString(string: "일기보기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        $0.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
        $0.alignTextBelow(spacing: 3.5)
    }
    
    lazy var profileButton = UIButton().then {
        $0.setImage(UIImage(systemName: "person"), for: .normal)
        let text = NSAttributedString(string: "프로필보기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        $0.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
        $0.alignTextBelow(spacing: 3.5)
    }
    
    lazy var roomButton = UIButton().then {
        $0.setImage(UIImage(systemName: "binoculars"), for: .normal)
        let text = NSAttributedString(string: "구경하기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        $0.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
        $0.alignTextBelow(spacing: 3.5)
    }
    
    let toolBarLine = UIView().then {
        $0.backgroundColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1.0)
    }
    
    override func addView() {
        [dailyButton,profileButton,roomButton, toolBarLine].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        dailyButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(125)
            $0.leading.equalTo(view.snp.leading).offset(0)
            $0.bottom.equalTo(view.snp.bottom).inset(27)
        }
        profileButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(125)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).inset(27)
        }
        roomButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(125)
            $0.trailing.equalTo(view.snp.trailing).inset(0)
            $0.bottom.equalTo(view.snp.bottom).inset(27)
        }
        toolBarLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(0)
            $0.bottom.equalTo(roomButton.snp.top).offset(0)
        }
    }
    
}
