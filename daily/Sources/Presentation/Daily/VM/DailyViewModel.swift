//
//  DailyViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/11/18.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class DailyViewModel: BaseViewModel, Stepper{
    var steps = PublishRelay<Step>()

}
