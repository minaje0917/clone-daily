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
import RxSwift

class SignInViewController: BaseViewController<SignInViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
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
    
    override func addView() {
        [backImage,signInText,subText].forEach {
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
    }

}
