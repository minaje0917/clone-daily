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
        case .loginIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.homeIsRequired)
        case .signUpIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.signUpIsRequired)
        case .introIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.introIsRequired)
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let vm = SignInViewModel()
        let vc = SignInViewController(vm)
        self.rootViewController.pushViewController(vc, animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
}
