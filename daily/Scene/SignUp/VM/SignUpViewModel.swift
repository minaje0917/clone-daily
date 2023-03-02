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

final class SignUpViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>()
    
    struct Input {
        let backSignInButtonTap: Observable<Void>
        let SignUpButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.backSignInButtonTap.subscribe(
            onNext: backSignInButtonTap
        ) .disposed(by: disposeBag)
        
        input.SignUpButtonTap.subscribe(
            onNext: pushMainVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushMainVC() { 
        self.steps.accept(DailyStep.mainIsRequired)
    }
    private func backSignInButtonTap() {
        self.steps.accept(DailyStep.signInIsRequired)
    }
}
