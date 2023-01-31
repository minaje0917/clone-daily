//
//  AppFlow.swift
//  daily
//
//  Created by 선민재 on 2023/01/30.
//

import RxFlow
import UIKit
import RxSwift
import RxCocoa

struct AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    
    init() {}
    
    var initialStep: Step {
        return DailyStep.loginIsRequired
    }
}

final class AppFlow: Flow {
    private var rootViewController = UINavigationController()
    
    var root: Presentable {
        return self.rootViewController
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DailyStep else {return .none}
        
        switch step {
        case .loginIsRequired:
            return coordinateToLogin()
        default:
            return .none
        } 
    }
    
    private func coordinateToLogin() -> FlowContributors {
        let flow = LoginFlow()
        Flows.use(flow, when: .created) { (root) in
            self.rootViewController = root as! UINavigationController
        }
        return .one(
            flowContributor: .contribute(
                withNextPresentable: flow,
                withNextStepper: OneStepper(withSingleStep: DailyStep.loginIsRequired)
        ))
    }
    
}
