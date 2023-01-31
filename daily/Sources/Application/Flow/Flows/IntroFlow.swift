//
//  IntroFlow.swift
//  daily
//
//  Created by 선민재 on 2023/01/31.
//

import RxFlow
import UIKit

class IntroFlow: Flow {

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
            return .end(forwardToParentFlowWithStep: DailyStep.homeIsRequired)
        case .signUpIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.signUpIsRequired)
        case .introIsRequired:
            return self.navigateToIntro()
        }
    }
    
    private func navigateToIntro() -> FlowContributors {
        let vm = IntroViewModel()
        let vc = IntroViewController(vm)
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }

}
