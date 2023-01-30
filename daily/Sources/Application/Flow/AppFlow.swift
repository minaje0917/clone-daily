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
    private let rootViewController = UINavigationController()
    private let navigationController = UINavigationController()
    
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
        let ivm = IntroViewModel()
        let ivc = IntroViewController(ivm)
        navigationController.pushViewController(ivc, animated: false)
        return .one(flowContributor: .contribute(withNext: ivc))
    }
    
    private func navigationToLogin() -> FlowContributors {
        let sivm = SignInViewModel()
        let sivc = SignInViewController(sivm)
        navigationController.pushViewController(sivc, animated: false)
        return .one(flowContributor: .contribute(withNext: sivc))
    }
    
    private func navigationToHome() -> FlowContributors {
        let mvm = MainViewModel()
        let mvc = MainViewController(mvm)
        navigationController.pushViewController(mvc, animated: false)
        return .one(flowContributor: .contribute(withNext: mvc))
    }
    
    private func navigationToSignUp() -> FlowContributors {
        let suvm = SignUpViewModel()
        let suvc = SignUpViewController(suvm)
        navigationController.pushViewController(suvc, animated: false)
        return .one(flowContributor: .contribute(withNext: suvc))
    }
    
}
