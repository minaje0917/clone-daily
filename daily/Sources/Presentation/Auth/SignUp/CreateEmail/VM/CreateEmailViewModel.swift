//
//  CreateEmailViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/06.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class CreateEmailViewModel: BaseViewModel, Stepper {
    
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
        self.steps.accept(DailyStep.certificationNumberIsRequired)
    }
    private func backSignInButtonTap() {
        self.steps.accept(DailyStep.signInIsRequired)
    }
}
