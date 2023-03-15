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
    
    // Mark: SignUp
    case createPwIsRequired
    case createEmailIsRequired
    case certificationNumberIsRequired
    case createNicknameIsRequired
    
    // Mark: Main
    case mainTabBarIsRequired
    
    // Mark: Profile
    case profileIsRequired
    
    // Mark: Theme
    case themeIsRequired
    
    // Mark: SignIn
    case signInIsRequired
    
    // Mark: Daily
    case dailyIsRequired
}
