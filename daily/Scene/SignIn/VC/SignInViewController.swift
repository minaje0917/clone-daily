//
//  SignInViewController.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxFlow

class SignInViewController: BaseViewController<SignInViewModel>{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = SignInViewModel.Input(
            signInButtonTap: signInButton.rx.tap.asObservable(),
            backSignUpButtonTap: backSignUpButton.rx.tap.asObservable()
        )
        viewModel.transVC(input: input)
    }
    
    let backImage = UIImageView().then {
        $0.image = UIImage(named: "SignInBackground.png")
    }
    
    let signInText = UILabel().then {
        $0.text = "Login"
        $0.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        $0.textColor = UIColor(red: 166 / 255, green: 73 / 255, blue: 141 / 255, alpha: 1.00)
    }
    
    let subText = UILabel().then {
        $0.text = "Welcome Back!"
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
    
    lazy var forgotPwButton = UIButton().then {
        let text = NSAttributedString(string: "Forgot Password?")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
    }
    
    lazy var signInButton = UIButton().then {
        let text = NSAttributedString(string: "Login")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.setTitleColor(UIColor(red: 191/255, green: 74/255, blue: 160/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 250/255, green: 194/255, blue: 215/255, alpha: 1.00)
        $0.layer.cornerRadius = 30
        $0.layer.applySketchShadow(color: .Shadow!, alpha: 0.3, x: 0, y: 4, blur: 4, spread: 0)
    }

    lazy var backSignUpButton = UIButton().then {
        let text = NSAttributedString(string: "Don’t have an account?")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.00), for: .normal)
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
    }
    override func addView() {
        [backImage,signInText,subText,emailTextField,emailUnderLine,pwTextField,pwUnderLine
        ,forgotPwButton,signInButton,backSignUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(0)
            $0.leading.trailing.equalToSuperview().offset(0)
        }
        signInText.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 5.75)
            $0.centerX.equalToSuperview()
        }
        subText.snp.makeConstraints {
            $0.top.equalTo(signInText.snp.bottom).offset(8)
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
        forgotPwButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwUnderLine.snp.bottom).offset(6)
        }
        signInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.height.equalTo(56)
            $0.top.equalTo(forgotPwButton.snp.bottom).offset((bounds.height) / 9.90)
        }
        backSignUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset((bounds.width) / 3.40)
            $0.top.equalTo(signInButton.snp.bottom).offset(8)
        }
    }

}
