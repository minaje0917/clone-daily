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
        self.navigationItem.backButton(title: "")
    }
    
    private func bindViewModel() {
        let input = SignInViewModel.Input(
            signInButtonTap: signInButton.rx.tap.asObservable(),
            backSignUpButtonTap: backSignUpButton.rx.tap.asObservable(),
            emailTextFieldTap: emailTextField.rx.controlEvent(.touchDown).asObservable()
        )
        viewModel.transVC(input: input)
    }
    
    private let signInText = UILabel().then {
        $0.text = "로그인"
        $0.font = UIFont.systemFont(
            ofSize: 32,
            weight: .bold
        )
        $0.textColor = UIColor.black
    }
    
    private let subText = UILabel().then {
        $0.text = "돌아오신 것을 환영합니다."
        $0.font = UIFont.systemFont(
            ofSize: 16,
            weight: .regular
        )
        $0.setSubTextColor()
    }
    
    var emailTextField = UITextField().then {
        $0.setBackGroundColor()
        $0.attributedPlaceholder = NSAttributedString(
            string: "이메일을 입력해 주세요.",
            attributes: [
                .foregroundColor: UIColor.dailyLight!,
                .font: UIFont.systemFont(
                    ofSize: 16,
                    weight: .regular
                )
        ])
        $0.layer.cornerRadius = 20
        $0.textColor = .black
        $0.addLeftImage(UIImage(named: "emailIcon.svg")!, x: 20, y: 6.5)
    }
    
    private var pwTextField = UITextField().then {
        $0.setBackGroundColor()
        $0.attributedPlaceholder = NSAttributedString(
            string: "비밀번호를 입력해 주세요.",
            attributes: [
                .foregroundColor: UIColor.dailyLight!,
                .font: UIFont.systemFont(
                    ofSize: 16,
                    weight: .regular
                )
        ])
        $0.layer.cornerRadius = 20
        $0.textColor = .black
        $0.isSecureTextEntry = true
        $0.addLeftImage(UIImage(named: "pwIcon.svg")!, x: 20, y: 5.5)
    }
    
    private var forgotPwButton = UIButton().then {
        let text = NSAttributedString(string: "비밀번호를 잊으셨나요?")
        $0.setAttributedTitle(
            text,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 12,
            weight: .regular
        )
        $0.setTitleColor(
            UIColor.dailyLight!,
            for: .normal
        )
        $0.backgroundColor = UIColor(
            red: 1,
            green: 1,
            blue: 1,
            alpha: 0
        )
    }
    
    private var signInButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(
            text,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 18,
            weight: .semibold
        )
        $0.setTitleColor(
            UIColor.white,
            for: .normal
        )
        $0.backgroundColor = UIColor(
            red: 255/255,
            green: 199/255,
            blue: 216/255,
            alpha: 1.00
        )
        $0.layer.cornerRadius = 20
    }
    
    private let firstTimeDailyText = UILabel().then {
        $0.text = "Daily가 처음이라면,"
        $0.font = UIFont.systemFont(
            ofSize: 12,
            weight: .regular
        )
        $0.textColor = UIColor(
            red: 183/255,
            green: 158/255,
            blue: 158/255,
            alpha: 1.00
        )
    }

    private var backSignUpButton = UIButton().then {
        let text = NSAttributedString(string: "회원가입")
        $0.setAttributedTitle(
            text,
            for: .normal
        )
        $0.titleLabel?.font = UIFont.systemFont(
            ofSize: 12,
            weight: .bold
        )
        $0.setTitleColor(
            UIColor(
                red: 255/255,
                green: 95/255,
                blue: 143/255,
                alpha: 1.00
            ),
            for: .normal
        )
        $0.backgroundColor = UIColor(
            red: 1,
            green: 1,
            blue: 1,
            alpha: 0
        )
    }
    
    override func addView() {
        [signInText,subText,emailTextField,pwTextField,forgotPwButton,signInButton,firstTimeDailyText,backSignUpButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        signInText.snp.makeConstraints {
            $0.top.equalToSuperview().offset((bounds.height) / 7.8)
            $0.leading.equalToSuperview().offset(21)
        }
        
        subText.snp.makeConstraints {
            $0.top.equalTo(signInText.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(21)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(subText.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(60)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(60)
        }
        
        forgotPwButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(28)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(forgotPwButton.snp.bottom).offset(26)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(60)
        }
        
        firstTimeDailyText.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(16)
            $0.trailing.equalTo(view.snp.centerX).offset(27)
        }
        
        backSignUpButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(16)
            $0.leading.equalTo(firstTimeDailyText.snp.trailing).offset(4)
            $0.height.equalTo(14)
        }
    }

}
