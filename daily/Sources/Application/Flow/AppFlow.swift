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
        return DailyStep.introIsRequired
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
        case .signUpIsRequired:
            return self.navigationToSignUp()
        case .homeIsRequired:
            return self.navigationToHome()
        case .loginIsRequired:
            return self.navigationToLogin()
        case .introIsRequired:
            return self.navigationToIntro()
        } 
    }
    
    private func navigationToIntro() -> FlowContributors {
        let introFlow = IntroFlow()
        Flows.use(introFlow, when: .created) { (root) in
            self.rootViewController = root as! UINavigationController
        }
        return .one(flowContributor: .contribute(withNextPresentable: introFlow, withNextStepper: OneStepper(withSingleStep: DailyStep.introIsRequired)))
    }
    
    private func navigationToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { (root) in
            self.rootViewController = root as! UINavigationController
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: DailyStep.loginIsRequired)))
    }
    
    private func navigationToHome() -> FlowContributors {
        let homeFlow = HomeFlow()
        Flows.use(homeFlow, when: .created) { (root) in
            self.rootViewController = root as! UINavigationController
        }
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: DailyStep.homeIsRequired)))
    }

    private func navigationToSignUp() -> FlowContributors {
        let signUpFlow = SignUpFlow()
        Flows.use(signUpFlow, when: .created) { (root) in
            self.rootViewController = root as! UINavigationController
        }
        return .one(flowContributor: .contribute(withNextPresentable: signUpFlow, withNextStepper: OneStepper(withSingleStep: DailyStep.signUpIsRequired)))
    }
    
}
