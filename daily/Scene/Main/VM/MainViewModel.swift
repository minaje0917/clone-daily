//
//  MainViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/11/11.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class MainViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>()
    
    struct Input {
        let dailyButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.dailyButtonTap.subscribe(
            onNext: dailyButtonTap
        ) .disposed(by: disposeBag)
    }
    
    private func dailyButtonTap() {
        self.steps.accept(DailyStep.DailyIsRequired)
    }
}
