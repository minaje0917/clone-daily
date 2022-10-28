//
//  SignUpViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxCocoa
import RxSwift

class SignUpViewModel{
    var coordinator: IntroCoordinator

    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }

    struct Input {
        let signInButtonTap: Observable<Void>
        let signUpButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
