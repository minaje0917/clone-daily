//
//  DailyToolBar.swift
//  daily
//
//  Created by 선민재 on 2022/11/14.
//

import UIKit
import Foundation
import RxFlow
import RxCocoa

class TabBarViewController: UITabBarController, Stepper{
    var steps = PublishRelay<Step>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVM = MainViewModel()
        let profileVM = ProfileViewModel()
        let themeVM = ThemeViewModel()
        let profileTab = ProfileViewController(profileVM)
        let themeTab = ThemeViewController(themeVM)
        let mainTab = MainViewController(mainVM)
        
        let navigationMain = UINavigationController(rootViewController: mainTab)
        let navigationProfile = UINavigationController(rootViewController: profileTab)
        let navigationTheme = UINavigationController(rootViewController: themeTab)
        
        mainTab.tabBarItem = UITabBarItem(
            title: "메인",
            image: UIImage(named: "unmain.svg"),
            selectedImage: UIImage(named: "selectMain.svg")
        )
        
        themeTab.tabBarItem = UITabBarItem(
            title: "테마보기",
            image: UIImage(named: "untheme.svg"),
            selectedImage: UIImage(named: "selectTheme.svg")
        )
        
        profileTab.tabBarItem = UITabBarItem(
            title: "프로필보기",
            image: UIImage(named: "unprofile.svg"),
            selectedImage: UIImage(named: "selectProfile.svg")
        )
        
        // MARK:
        tabBar.tintColor = UIColor.mainColor
        tabBar.unselectedItemTintColor = UIColor.dailyLight
        tabBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        self.hidesBottomBarWhenPushed = false
        
        setViewControllers([navigationMain,navigationProfile,navigationTheme], animated: false)
        setTabBarRound()
        
    }
    
    private func setTabBarRound() {
        tabBar.layer.cornerRadius = 24
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
