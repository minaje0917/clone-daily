//
//  HomeFlow.swift
//  daily
//
//  Created by 선민재 on 2023/01/31.
//

import RxFlow
import UIKit

class HomeFlow: Flow {

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
            return .end(forwardToParentFlowWithStep: DailyStep.loginIsRequired)
        case .homeIsRequired:
            return self.navigateToHome()
        case .signUpIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.signUpIsRequired)
        case .introIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.introIsRequired)
        }
    }
    
    private func navigateToHome() -> FlowContributors {
        let vm = MainViewModel()
        let vc = MainViewController(vm)
        self.rootViewController.pushViewController(vc, animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
}
