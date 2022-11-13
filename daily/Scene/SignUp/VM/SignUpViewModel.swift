//
//  SignUpViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxCocoa
import RxSwift

class SignUpViewModel:BaseViewModel{
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }

    struct Input {
        let signUpButtonTap: Observable<Void>
    }

    struct Output {
        
    }
    func transVC(input:Input) {
        input.signUpButtonTap.subscribe(
        onNext: pushMainVC
        ) .disposed(by: disposeBag)
    }
    private func pushMainVC() {
        coordinator.pushMainVC()
    }
}
