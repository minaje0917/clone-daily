//
//  SignIn.swift
//  daily
//
//  Created by 선민재 on 2023/04/03.
//

import Foundation

public struct SignIn: Equatable {
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    public let email: String
    public let password: String
}
