//
//  ThemeFlow.swift
//  daily
//
//  Created by 선민재 on 2023/03/15.
//
import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct ThemeStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return DailyStep.themeIsRequired
    }
}

class ThemeFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper = ThemeStepper()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DailyStep else { return .none }
        switch step {
        case .themeIsRequired:
            return coordinateToTheme()
            
        case .mainTabBarIsRequired:
            return .one(flowContributor: .forwardToParentFlow(withStep: DailyStep.mainTabBarIsRequired))
        
        case let .dailyIsRequired(date, content):
            return coordinateToDaily(date: date, content: content)
            
        case let .alert(title, message, style, actions):
            return presentToAlert(title: title, message: message, style: style, actions: actions)
            
        case let .failureAlert(title, message, action):
            return presentToFailureAlert(title: title, message: message, action: action)
            
        default:
            return .none
        }
    }
    
    private func coordinateToTheme() -> FlowContributors {
        let vm = ThemeViewModel()
        let vc = ThemeViewController(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func coordinateToDaily(date: String, content: String) -> FlowContributors {
        let vm = DailyViewModel()
        let vc = DailyViewController(date: date, content: content)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func presentToAlert(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction]) -> FlowContributors {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        self.rootViewController.topViewController?.present(alert, animated: true)
        return .none
    }
    
    private func presentToFailureAlert(title: String?, message: String?, action: [UIAlertAction]) -> FlowContributors {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if !action.isEmpty {
            action.forEach(alert.addAction(_:))
        } else {
            alert.addAction(.init(title: "확인", style: .default))
        }
        self.rootViewController.topViewController?.present(alert, animated: true)
        return .none
    }
}
