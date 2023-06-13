//
//  DailyStep.swift
//  daily
//
//  Created by 선민재 on 2023/01/30.
//

import RxFlow
import UIKit

enum DailyStep: Step {
    //MARK: Splash
    case splashIsRequired
    
    // MARK: Login
    case loginIsRequired
    
    // MARK: SignUp
    case createPwIsRequired
    case createEmailIsRequired
    case certificationNumberIsRequired
    case createNicknameIsRequired
    
    //MARK: ForgotPassword
    case forgotPasswordIsRequired
    case authKeyIsRequired
    case changePasswordIsRequired
    
    // MARK: Main
    case mainTabBarIsRequired
    
    // MARK: Profile
    case profileIsRequired
    
    // MARK: Theme
    case themeIsRequired
    
    // MARK: SignIn
    case signInIsRequired
    
    // MARK: Daily
    case dailyIsRequired(date: String, content: String)
    
    // MARK: Main
    case mainIsRequired
    
    //MARK: Alert
    case alert(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction])
    case failureAlert(title: String?, message: String?, action: [UIAlertAction] = [])
}
