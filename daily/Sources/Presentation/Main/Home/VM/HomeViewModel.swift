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

class HomeViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>()
    
    func pushDailyVC() {
        self.steps.accept(DailyStep.dailyIsRequired)
    }
}
