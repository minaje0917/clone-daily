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

    init(){}

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DailyStep else { return .none }
        switch step {
        case .loginIsRequired:
            return coordinateToLogin()
        case .signInIsRequired:
            return navigateToSignIn()
        case .mainIsRequired:
            return .end(forwardToParentFlowWithStep: DailyStep.mainIsRequired)
        case .createPwIsRequired:
            return navigateToCreatePw()
        case .createEmailIsRequired:
            return navigateToCreateEmail()
        case .certificationNumberIsRequired:
            return navigationToCertificationNumber()
        case .createNicknameIsRequired:
            return navigationToCreateNickname()
        default:
            return .none
        }
    }
    
    private func coordinateToLogin() -> FlowContributors {
        let vm = IntroViewModel()
        let vc = IntroViewController(vm)
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigateToSignIn() -> FlowContributors {
        let vm = SignInViewModel()
        let vc = SignInViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigateToCreatePw() -> FlowContributors {
        let vm = CreatePwViewModel()
        let vc = CreatePwViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigateToCreateEmail() -> FlowContributors {
        let vm = CreateEmailViewModel()
        let vc = CreateEmailViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigationToCertificationNumber() -> FlowContributors {
        let vm = CertificationNumberViewModel()
        let vc = CertificationNumberViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func navigationToCreateNickname() -> FlowContributors {
        let vm = CreateNicknameViewModel()
        let vc = CreateNicknameViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
