//
//  ProfileViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/09.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class ProfileViewModel: BaseViewModel, Stepper{
    var steps = PublishRelay<Step>()

}
