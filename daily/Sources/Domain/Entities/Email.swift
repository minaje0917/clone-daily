//
//  Email.swift
//  daily
//
//  Created by 선민재 on 2023/04/04.
//

import Foundation

public struct Email {
    
    public init(email: String, authKey: Int) {
        self.email = email
        self.authKey = authKey
    }
    
    public let email: String
    public let authKey: Int
}
