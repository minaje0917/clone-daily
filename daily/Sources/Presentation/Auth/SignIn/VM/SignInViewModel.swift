//
//  SignInViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class SignInViewModel: BaseViewModel, Stepper {
    
    struct Input {
        let signInButtonTap: Observable<Void>
        let backSignUpButtonTap: Observable<Void>
        let emailTextFieldTap: Observable<Void>
        let forgotPwButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.signInButtonTap.subscribe(
            onNext: pushMainVC
        ) .disposed(by: disposeBag)
        
        input.backSignUpButtonTap.subscribe(
            onNext: pushCreatePwVC
        ) .disposed(by: disposeBag)
        
        input.emailTextFieldTap.subscribe(
            onNext: emailTextFieldDidTap
        ).disposed(by: disposeBag)
        
        input.forgotPwButtonTap.subscribe(
            onNext: pushForgotPwVC
        ).disposed(by: disposeBag)
    }
    
    private func pushMainVC() {
        self.steps.accept(DailyStep.mainTabBarIsRequired)
    }
    
    private func pushCreatePwVC() {
        self.steps.accept(DailyStep.createPwIsRequired)
    }
    
    private func pushForgotPwVC() {
        self.steps.accept(DailyStep.forgotPasswordIsRequired)
    }
    
    private func emailTextFieldDidTap() {
        let vc = SignInViewController(self)
        print("emailTextFieldDidTap")
        vc.emailTextField.layer.borderWidth = 1
        vc.emailTextField.layer.borderColor = UIColor.mainColor?.cgColor
    }
}
