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
    var steps = PublishRelay<Step>()
    
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
