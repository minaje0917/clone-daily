//
//  ThemeViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/09.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class ThemeViewModel: BaseViewModel, Stepper{
    struct Input {
        let xmarkButtonDidTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.xmarkButtonDidTap.subscribe(
            onNext: pushHomeVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushHomeVC() {
        self.steps.accept(DailyStep.profileIsRequired)
    }
}
