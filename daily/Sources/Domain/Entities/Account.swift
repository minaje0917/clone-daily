//
//  Account.swift
//  daily
//
//  Created by 선민재 on 2023/04/04.
//

import Foundation

public struct Account: Equatable {
    
    public init(email: String, password: String, newPassword: String, theme: ThemeType) {
        self.email = email
        self.password = password
        self.newPassword = newPassword
        self.theme = theme
    }
    
    public let email: String
    public let password: String
    public let newPassword: String
    public let theme: ThemeType
}
