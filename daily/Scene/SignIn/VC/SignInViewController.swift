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
    
    override func addView() {
        [backImage].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(0)
            $0.leading.trailing.equalToSuperview().offset(0)
        }
    }

}
