//
//  MainStep.swift
//  daily
//
//  Created by 선민재 on 2023/01/30.
//

import RxFlow

enum MainStep: Step {
    case loginIsRequired
//    case userIsLoggedIn
    
    case signUpIsRequired
//    case userIsSignUp
    
    case homeIsRequired
}
