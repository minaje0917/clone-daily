//
//  SelectThemeViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/24.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class SelectThemeViewModel: BaseViewModel, Stepper{
    var steps = PublishRelay<Step>()

}
