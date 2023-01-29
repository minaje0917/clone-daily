//
//  AppFlow.swift
//  daily
//
//  Created by 선민재 on 2023/01/30.
//

import RxFlow
import UIKit

class AppFlow: Flow {
    private let rootViewController = UINavigationController()
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private func navigationToLogin() {
        
    }
    
    private func navigationToHome() {
        
    }
    
    private func navigationToSignUp() {
        
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else {return .none}
        
        switch step {
        case .signUpIsRequired:
            return self.navigationToSignUp()
        case .homeIsRequired:
            return self.navigationToHome()
        case .loginIsRequired:
            return self.navigationToLogin()
        }
    }
    
}
