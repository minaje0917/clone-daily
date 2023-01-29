//
//  SignUpViewController.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxFlow

class SignUpViewController: BaseViewController<SignUpViewModel> {
    
    var steps = PublishRelay<Step>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let backImage = UIImageView().then {
        $0.image = UIImage(named: "SignInBackground.png")
    }
    
    let signUpText = UILabel().then {
        $0.text = "Sign Up"
        $0.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        $0.textColor = UIColor(red: 166 / 255, green: 73 / 255, blue: 141 / 255, alpha: 1.00)
    }
    
    let subText = UILabel().then {
        $0.text = "Welcome Daily!"
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        $0.textColor = UIColor(red: 166 / 255, green: 73 / 255, blue: 141 / 255, alpha: 1.00)
    }
    
    lazy var emailTextField = UITextField().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.00)
        $0.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.00)])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
    }
    
    let emailUnderLine = UIView().then {
        $0.backgroundColor = UIColor(red: 250/255, green: 194/255, blue: 215/255, alpha: 1.00)
    }
    
    lazy var pwTextField = UITextField().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.00)
        $0.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.00)])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.isSecureTextEntry = true
    }
    
    let pwUnderLine = UIView().then {
        $0.backgroundColor = UIColor(red: 250/255, green: 194/255, blue: 215/255, alpha: 1.00)
    }
    
    lazy var confirmPwTextField = UITextField().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.00)
        $0.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.00)])
        $0.textColor = .black
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.4)
        $0.isSecureTextEntry = true
    }
    
    let confirmPwTUnderLine = UIView().then {
        $0.backgroundColor = UIColor(red: 250/255, green: 194/255, blue: 215/255, alpha: 1.00)
    }
    
    lazy var signUpButton = UIButton().then {
        let text = NSAttributedString(string: "Confirm")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.setTitleColor(UIColor(red: 191/255, green: 74/255, blue: 160/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 250/255, green: 194/255, blue: 215/255, alpha: 1.00)
        $0.layer.cornerRadius = 30
        $0.layer.applySketchShadow(color: .Shadow!, alpha: 0.3, x: 0, y: 4, blur: 4, spread: 0)
        $0.addTarget(self, action: #selector(signUpBtnDidTap), for: .touchUpInside)
    }

    lazy var backSignInButton = UIButton().then {
        let text = NSAttributedString(string: "Do you have an account?")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        $0.addTarget(self, action: #selector(backSignInBtnDidTap), for: .touchUpInside)
    }
    
    @objc func signUpBtnDidTap() {
        self.steps.accept(MainStep.homeIsRequired)
    }
    
    @objc func backSignInBtnDidTap() {
        self.steps.accept(MainStep.loginIsRequired)
    }
    
    override func addView() {
        [backImage,signUpText,subText,emailTextField,emailUnderLine,pwTextField,pwUnderLine
         ,confirmPwTextField,confirmPwTUnderLine,signUpButton,backSignInButton].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(0)
            $0.leading.trailing.equalToSuperview().offset(0)
        }
        signUpText.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 5.75)
            $0.centerX.equalToSuperview()
        }
        subText.snp.makeConstraints {
            $0.top.equalTo(signUpText.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(0)
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        emailUnderLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1.5)
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(emailUnderLine.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        pwUnderLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1.5)
            $0.top.equalTo(pwTextField.snp.bottom).offset(10)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        confirmPwTextField.snp.makeConstraints {
            $0.top.equalTo(pwUnderLine.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        confirmPwTUnderLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1.5)
            $0.top.equalTo(confirmPwTextField.snp.bottom).offset(10)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        signUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.height.equalTo(56)
            $0.top.equalTo(confirmPwTUnderLine.snp.bottom).offset((bounds.height) / 11.6)
        }
        backSignInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset((bounds.width) / 3.40)
            $0.top.equalTo(signUpButton.snp.bottom).offset(8)
        }
    }
    
}
