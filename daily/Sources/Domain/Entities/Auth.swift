//
//  File.swift
//  daily
//
//  Created by 선민재 on 2023/04/04.
//

import Foundation

public struct Auth: Equatable {
    
    public init(email: String, password: String, name: String) {
        self.email = email
        self.password = password
        self.name = name
    }
    
    public let email: String
    public let password: String
    public let name: String
}
