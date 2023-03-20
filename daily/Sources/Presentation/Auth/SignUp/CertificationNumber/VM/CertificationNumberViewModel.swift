//
//  CertificationNumberViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/06.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class CertificationNumberViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>()
    
    struct Input {
        
    }
    
    struct Output {
        
    }
}

