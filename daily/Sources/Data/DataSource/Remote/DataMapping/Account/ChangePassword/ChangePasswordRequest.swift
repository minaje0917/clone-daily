//
//  ChangePasswordRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct ChangePasswordRequset: Encodable {
    public init(email: String, password: String, newPassword: String) {
        self.email = email
        self.password = password
        self.newPassword = newPassword
    }
    
    public let email: String
    public let password: String
    public let newPassword: String
}
