//
//  ThemeFlow.swift
//  daily
//
//  Created by 선민재 on 2023/03/15.
//
import RxFlow
import UIKit

class ThemeFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DailyStep else { return .none }
        switch step {
//        case .mainTabBarIsRequired:
//            return .end(forwardToParentFlowWithStep: DailyStep.mainTabBarIsRequired)
//
//        case .loginIsRequired:
//            return .end(forwardToParentFlowWithStep: DailyStep.loginIsRequired)
//
        default:
            return .none
        }
    }
    
//    private func coordinateToDaily() -> FlowContributors {
//        let vc = DailyTabBarViewController()
//        self.rootViewController.setViewControllers([vc], animated: true)
//        return .one(flowContributor: .contribute(withNext: vc))
//    }
}
