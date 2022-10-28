//
//  IntroCoordinator.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxCocoa
import RxSwift

class IntroCoordinator:Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let window: UIWindow
    
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        window.rootViewController = navigationController
    }
    
    func start() {
        let introVM = IntroViewModel(coordinator: self)
        let introVC = IntroViewController(introVM)
        navigationController.setViewControllers([introVC], animated: true)
    }
    func pushSignInVC() {
        let signInVM = SignInViewModel(coordinator: self)
        let signInVC = SignInViewController(signInVM)
        navigationController.pushViewController(signInVC, animated: true)
    }
    func pushSignUpVC() {
        let signUpVM = SignUpViewModel(coordinator: self)
        let signUpVC = SignUpViewController(signUpVM)
        navigationController.pushViewController(signUpVC, animated: true)
    }
}
