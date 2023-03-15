//
//  DailyStep.swift
//  daily
//
//  Created by 선민재 on 2023/01/30.
//

import RxFlow

enum DailyStep: Step {
    // Mark: Login
    case loginIsRequired
    
    // MARK: SignUp
    case createPwIsRequired
    case createEmailIsRequired
    case certificationNumberIsRequired
    case createNicknameIsRequired
    
    // MARK: Main
    case mainTabBarIsRequired
    
    // MARK: Profile
    case profileIsRequired
    
    // MARK: Theme
    case themeIsRequired
    
    // MARK: SignIn
    case signInIsRequired
    
    // MARK: Daily
    case dailyIsRequired
    
    // MARK: Main
    case mainIsRequired
}
