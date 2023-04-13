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
        let forgotPwButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) -> Output {
        input.signInButtonTap.subscribe(
            onNext: pushMainVC
        ) .disposed(by: disposeBag)
        
        input.backSignUpButtonTap.subscribe(
            onNext: pushCreateEmailVC
        ) .disposed(by: disposeBag)
        
        input.forgotPwButtonTap.subscribe(
            onNext: pushForgotPwVC
        ).disposed(by: disposeBag)
        return Output()
    }
    
    private func pushMainVC() {
        self.steps.accept(DailyStep.mainTabBarIsRequired)
    }
    
    private func pushCreateEmailVC() {
        self.steps.accept(DailyStep.createEmailIsRequired)
    }
    
    private func pushForgotPwVC() {
        self.steps.accept(DailyStep.forgotPasswordIsRequired)
    }
}
