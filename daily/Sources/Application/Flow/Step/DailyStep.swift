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
    
    // Mark: Main
    case mainIsRequired
    
    // Mark: SignIn
    case signInIsRequired
    
    // Mark: Daily
    case dailyIsRequired
}
