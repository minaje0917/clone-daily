//
//  LoginFlow.swift
//  daily
//
//  Created by 선민재 on 2023/01/31.
//

import RxFlow
import UIKit

class LoginFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init() {}

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DailyStep else { return .none }
        switch step {
        case .signInIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return self.navigateToHome()
        case .signUpIsRequired:
            return self.navigateToSignUp()
        default:
            return .none
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let vm = SignInViewModel()
        let vc = SignInViewController(vm)
        self.rootViewController.pushViewController(vc, animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
    private func navigateToSignUp() -> FlowContributors {
        let vm = SignUpViewModel()
        let vc = SignUpViewController(vm)
        self.rootViewController.pushViewController(vc, animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
    private func navigateToHome() -> FlowContributors {
        let vm = MainViewModel()
        let vc = MainViewController(vm)
        self.rootViewController.pushViewController(vc, animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
}
