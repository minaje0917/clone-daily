//
//  CheckEmailViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/04/04.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class CheckEmailViewModel: BaseViewModel, Stepper {
    
    struct Input {
        let backSignInButtonTap: Observable<Void>
        let getNumButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.backSignInButtonTap.subscribe(
            onNext: backSignInButtonTap
        ) .disposed(by: disposeBag)

        input.getNumButtonTap.subscribe(
            onNext: pushCertificationNumberVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushCertificationNumberVC() {
        self.steps.accept(DailyStep.authKeyIsRequired)
    }
    private func backSignInButtonTap() {
        self.steps.accept(DailyStep.signInIsRequired)
    }
}
