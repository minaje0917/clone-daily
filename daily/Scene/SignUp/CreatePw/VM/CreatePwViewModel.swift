//
//  SignUpViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class CreatePwViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>()
    
    struct Input {
        let backSignInButtonTap: Observable<Void>
        let nextButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.backSignInButtonTap.subscribe(
            onNext: pushSignInVC
        ) .disposed(by: disposeBag)
        
        input.nextButtonTap.subscribe(
            onNext: pushCreateEmailVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushCreateEmailVC() {
        self.steps.accept(DailyStep.createEmailIsRequired)
    }
    private func pushSignInVC() {
        self.steps.accept(DailyStep.signInIsRequired)
    }
}
