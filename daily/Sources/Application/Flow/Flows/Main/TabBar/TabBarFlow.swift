//
//  TabBarFlow.swift
//  daily
//
//  Created by 선민재 on 2023/03/15.
//

import RxFlow
import UIKit

final class TabBarFlow: Flow {
    
    enum TabIndex: Int {
        case home = 0
        case profile = 1
        case theme = 2
    }
    
    var root: Presentable {
        return self.rootVC
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    
    private let rootVC = DailyTabBarViewController()
    
    private var homeFlow = HomeFlow()
    private var profileFlow = ProfileFlow()
    private var themeFlow = ThemeFlow()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DailyStep else {return .none}
        
        switch step {
            
        case .mainTabBarIsRequired:
            return coordinateToMainTabbar(index: 0)
            
        case .profileIsRequired:
            return coordinateToMainTabbar(index: 1)
            
        case .themeIsRequired:
            return coordinateToMainTabbar(index: 2)
                        
        case let .alert(title, message, style, actions):
            return presentToAlert(title: title, message: message, style: style, actions: actions)
            
        case let .failureAlert(title, message, action):
            return presentToFailureAlert(title: title, message: message, action: action)
            
        default:
            return .none
        }
    }
    
}

private extension TabBarFlow {
    func coordinateToMainTabbar(index: Int) -> FlowContributors {
        Flows.use(
            homeFlow, profileFlow, themeFlow,
            when: .ready
        ) { [unowned self] (root1: UINavigationController,
                            root2: UINavigationController,
                            root3: UINavigationController) in
            
            let mainItem = UITabBarItem(
                title: "메인",
                image: UIImage(named: "unmain.svg"),
                selectedImage: UIImage(named: "selectMain.svg")
            )
            
            let profileItem = UITabBarItem(
                title: "프로필보기",
                image: UIImage(named: "unprofile.svg"),
                selectedImage: UIImage(named: "selectProfile.svg")
            )
            
            let themeItem = UITabBarItem(
                title: "테마보기",
                image: UIImage(named: "untheme.svg"),
                selectedImage: UIImage(named: "selectTheme.svg")
            )
            root1.tabBarItem = mainItem
            root2.tabBarItem = profileItem
            root3.tabBarItem = themeItem
            
            self.rootVC.setViewControllers([root1,root2,root3], animated: false)
            self.rootVC.selectedIndex = index

        }
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: homeFlow, withNextStepper: homeFlow.stepper),
            .contribute(withNextPresentable: profileFlow, withNextStepper: profileFlow.stepper),
            .contribute(withNextPresentable: themeFlow, withNextStepper: themeFlow.stepper)
        ])
    }
    
    func presentToAlert(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction]) -> FlowContributors {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        self.rootViewController.topViewController?.present(alert, animated: true)
        return .none
    }
    
    func presentToFailureAlert(title: String?, message: String?, action: [UIAlertAction]) -> FlowContributors {
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
