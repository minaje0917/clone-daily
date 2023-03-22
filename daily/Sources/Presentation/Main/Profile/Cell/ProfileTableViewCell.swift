//
//  ProfileTableViewCell.swift
//  daily
//
//  Created by 선민재 on 2023/03/22.
//

import UIKit
import Then
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    
    private let diaryText = UILabel().then {
        $0.text = "화장실에서 선민재를 봤는데 선민재가..."
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .black
    }
    private let dateText = UILabel().then {
        $0.text = "12월 12일"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = UIColor.dailyLight
    }
    
    private let diaryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 17
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        [diaryStackView].forEach {
            contentView.addSubview($0)
        }
        [diaryText, dateText].forEach {
            diaryStackView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        diaryStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
