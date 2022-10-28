//
//  ViewController.swift
//  daily
//
//  Created by 선민재 on 2022/10/27.
//

import UIKit
import Then
import SnapKit

class IntroViewController: BaseViewController<IntroViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    let background = UIImageView().then{
        $0.image = UIImage(named: "background.png")
    }
    
    let mainText = UILabel().then {
        $0.text = "DAILY"
        $0.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        $0.textColor = .Maintext
    }
    
    let signupText = UILabel().then {
        $0.text = "Sign Up"
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        $0.textColor = .black
    }
    
    let nowText = UILabel().then {
        $0.text = "it's Daily Sign Up now"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor(red: 165 / 255, green: 165 / 255, blue: 165 / 255, alpha: 1.00)
    }
    
    lazy var loginButton = UIButton().then {
        let text = NSAttributedString(string: "Login")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.setTitleColor(UIColor(red: 191/255, green: 74/255, blue: 160/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 250/255, green: 194/255, blue: 215/255, alpha: 1.00)
        $0.layer.cornerRadius = 30
    }
    lazy var signupButton = UIButton().then {
        let text = NSAttributedString(string: "Sign Up")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        $0.layer.cornerRadius = 30
    }
    
    override func addView() {
        [background,mainText,signupText,nowText,loginButton,signupButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        background.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
        mainText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo((bounds.height) / 10.68)
        }
        signupText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo((bounds.height) / 1.60)
        }
        nowText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signupText.snp.bottom).offset(4)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.top.equalTo(nowText.snp.bottom).offset((bounds.height) / 16.57)
            $0.height.equalTo((bounds.height) / 14.5)
        }
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.height.equalTo((bounds.height) / 14.5)
        }
    }

}

extension UIColor {
    class var Maintext: UIColor?{return UIColor(named: "Maintext")}
}

