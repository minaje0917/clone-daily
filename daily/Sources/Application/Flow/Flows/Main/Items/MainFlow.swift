//
//  MainFlow.swift
//  daily
//
//  Created by 선민재 on 2023/02/09.
//
import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct MainStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return DailyStep.mainIsRequired
    }
}

class MainFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper: MainStepper?
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DailyStep else { return .none }
        switch step {
        case .mainTabBarIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.mainTabBarIsRequired)
            
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.loginIsRequired)
            
        case .dailyIsRequired:
            return coordinateToDaily()
            
        case .mainIsRequired:
            return coordinateToMain()
            
        default:
            return .none
        }
    }
    
    private func coordinateToDaily() -> FlowContributors {
        let vm = DailyViewModel()
        let vc = DailyViewController(vm)
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func coordinateToMain() -> FlowContributors {
        let vm = MainViewModel()
        let vc = MainViewController(vm)
        self.rootViewController.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
