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
    
    var steps = PublishRelay<Step>()
    
    struct Input {
        let signInButtonTap: Observable<Void>
        let backSignUpButtonTap: Observable<Void>
//        let emailTextFieldTap: Observable<Void>
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
    }
    
//    func changeTextField(input: Input) {
//        input.emailTextFieldTap.subscribe(
//            onNext: emailTextFieldDidTap
//        ).disposed(by: disposeBag)
//    }
    
    private func pushMainVC() {
        self.steps.accept(DailyStep.mainIsRequired)
    }
    private func pushCreatePwVC() {
        self.steps.accept(DailyStep.createPwIsRequired)
    }
//    private func emailTextFieldDidTap() {
//        print("emailTextFieldDidTap")
//    }
}
