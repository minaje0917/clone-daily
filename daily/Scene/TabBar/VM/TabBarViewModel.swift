//
//  TabBarViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/14.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class TabBarViewModel: BaseViewModel, Stepper{
    var steps = PublishRelay<Step>()

}
