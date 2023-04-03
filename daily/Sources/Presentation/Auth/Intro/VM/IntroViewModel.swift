//
//  IntroViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/27.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class IntroViewModel: BaseViewModel, Stepper {
    
    struct Input {
        let signInButtonTap: Observable<Void>
        let signUpButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.signInButtonTap.subscribe(
            onNext: pushSignInVC
        ) .disposed(by: disposeBag)
        
        input.signUpButtonTap.subscribe(
            onNext: pushSignUpVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushSignInVC() {
        self.steps.accept(DailyStep.signInIsRequired)
    }
    private func pushSignUpVC() {
        self.steps.accept(DailyStep.createPwIsRequired)
    }
}
