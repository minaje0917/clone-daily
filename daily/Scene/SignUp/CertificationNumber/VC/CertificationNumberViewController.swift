//
//  CertificationNumberViewController.swift
//  daily
//
//  Created by 선민재 on 2023/03/06.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxFlow
import DPOTPView

class CertificationNumberViewController: BaseViewController<CertificationNumberViewModel>, Stepper{
    var steps = PublishRelay<Step>()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationItem.backButton(title: "")
    }
    
    private lazy var timerLabel = UILabel().then {
        $0.text = "4 : 59"
        $0.font = UIFont.systemFont(
            ofSize: 40,
            weight: .bold
        )
        $0.tintColor = UIColor.black
    }
    
    private let explainText = UILabel().then {
        $0.text = "이메일로 인증번호를 발송했습니다.\n인증번호는 5분 뒤 만료됩니다."
        $0.font = UIFont.systemFont(
            ofSize: 14,
            weight: .regular
        )
        $0.textAlignment = .center
        $0.tintColor = UIColor(
            red: 183/255,
            green: 158/255,
            blue: 158/255,
            alpha: 1.00
        )
        $0.numberOfLines = 2
    }
    
    private lazy var certificationNumberTextField = DPOTPView().then {
        $0.count = 4
        $0.spacing = 16
        $0.fontTextField = UIFont.systemFont(
            ofSize: 24,
            weight: .semibold
        )
        $0.backGroundColorTextField = UIColor(
            red: 1.00,
            green: 245/255,
            blue: 247/255,
            alpha: 1.00
        )
        $0.cornerRadiusTextField = 20
        $0.selectedBorderColorTextField = UIColor.mainColor
    }
    
    private lazy var reSendButton = UIButton().then {
        let text = NSAttributedString(string: "재전송")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 14,
            weight: .semibold
        )
        $0.setTitleColor(UIColor.mainColor, for: .normal)
        $0.backgroundColor = UIColor(
            red: 1,
            green: 1,
            blue: 1,
            alpha: 0
        )
    }
    
    override func addView() {
        [timerLabel,explainText,certificationNumberTextField,reSendButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        timerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset((bounds.height) / 6.34)
        }
        
        explainText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(timerLabel.snp.bottom).offset(8)
        }
        
        certificationNumberTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(explainText.snp.bottom).offset(32)
        }
        
        reSendButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(certificationNumberTextField.snp.bottom).offset(16)
        }
    }
}
