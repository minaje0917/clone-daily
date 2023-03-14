//
//  MainFlow.swift
//  daily
//
//  Created by 선민재 on 2023/02/09.
//
import RxFlow
import UIKit

class MainFlow: Flow {

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
        case .mainIsRequired:
            return coordinateToHome()
            
        case .dailyIsRequired:
            return navigateToDaily()
            
        case .profileIsRequired:
            return navigateToProfile()
            
        case .themeIsRequired:
            return navigateToTheme()
            
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.loginIsRequired)
            
        default:
            return .none
        }
    }
    
    private func coordinateToHome() -> FlowContributors {
        let vc = TabBarViewController()
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNext: vc))
    }
    
    private func navigateToDaily() -> FlowContributors {
        let vm = DailyViewModel()
        let vc = DailyViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigateToProfile() -> FlowContributors {
        let vm = ProfileViewModel()
        let vc = ProfileViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigateToTheme() -> FlowContributors {
        let vm = ThemeViewModel()
        let vc = ThemeViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
