//
//  SignInViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewModel:BaseViewModel {
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }

    struct Input {
        let signInButtonTap: Observable<Void>
    }

    struct Output {
        
    }
    func transVC(input:Input) {
        input.signInButtonTap.subscribe(
        onNext: pushMainVC
        ) .disposed(by: disposeBag)
    }
    private func pushMainVC() {
        coordinator.pushMainVC()
    }
}
