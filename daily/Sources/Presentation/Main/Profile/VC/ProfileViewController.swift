//
//  ProfileViewController.swift
//  daily
//
//  Created by 선민재 on 2023/03/09.
//

import UIKit
import Then
import SnapKit

class ProfileViewController: BaseViewController<ProfileViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let dailyUserImage = UIImageView().then {
        $0.image = UIImage(named: "DailyUserImage.svg")
    }
    
    private let userName = UILabel().then {
        $0.text = "데일리_선"
        $0.font = UIFont.systemFont(
            ofSize: 16,
            weight: .bold
        )
        $0.textColor = .black
    }
    
    private let userEmail = UILabel().then {
        $0.text = "s21031@gsm.hs.kr"
        $0.font = UIFont.systemFont(
            ofSize: 12,
            weight: .regular
        )
        $0.textColor = UIColor.dailyLight
    }
    
    private let topStackView = UIStackView().then {
        $0.spacing = 8
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    private let diaryList = UITableView().then {
        $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        $0.separatorStyle = .none
        $0.rowHeight = 49
        $0.layer.cornerRadius = 16
    }

    override func addView() {
        [dailyUserImage, topStackView, diaryList].forEach {
            view.addSubview($0)
        }
        [userName, userEmail].forEach {
            topStackView.addArrangedSubview($0)
        }
    }
    
    override func setLayout() {
        dailyUserImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.leading.equalToSuperview().offset(20)
        }
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(112)
            $0.leading.equalTo(dailyUserImage.snp.trailing).offset(16)
        }
        diaryList.snp.makeConstraints {
            $0.top.equalTo(dailyUserImage.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
    }
}
