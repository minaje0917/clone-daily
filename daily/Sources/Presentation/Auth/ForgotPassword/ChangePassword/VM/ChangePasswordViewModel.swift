//
//  ChangePasswordViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/04/04.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class ChangePasswordViewModel: BaseViewModel, Stepper {
    struct Input {
        let backSignInButtonTap: Observable<Void>
        let finishButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.backSignInButtonTap.subscribe(
            onNext: pushSignInVC
        ) .disposed(by: disposeBag)
        
        input.finishButtonTap.subscribe(
            onNext: pushSignInVC
        ) .disposed(by: disposeBag)
    }

    private func pushSignInVC() {
        self.steps.accept(DailyStep.signInIsRequired)
    }
}
