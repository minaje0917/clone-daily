//
//  BaseViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class BaseViewModel{
    var disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()
} 
