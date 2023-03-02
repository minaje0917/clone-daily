//
//  DailyViewController.swift
//  daily
//
//  Created by 선민재 on 2022/11/18.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class DailyViewController: BaseViewController<DailyViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: .none, action: nil)
    }
    
    let dailyBackground = UIImageView().then {
        $0.image = UIImage(named: "DailyBackground.svg")
    }
    
    let dailyTextfield = UITextField().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.00)
        $0.attributedPlaceholder = NSAttributedString(string: "일기를 적어봐!", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 143/255, green: 143/255, blue: 143/255, alpha: 1.00)])
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    override func addView() {
        [dailyBackground,dailyTextfield].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        dailyBackground.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(0)
            $0.top.bottom.equalToSuperview().inset(0)
        }
        dailyTextfield.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(24)
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 7.58)
            $0.bottom.equalTo(view.snp.bottom).inset(24)
        }
    }

}
