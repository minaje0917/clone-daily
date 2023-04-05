//
//  SignUpAuthKeyRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct SignUpAuthKeyRequest: Encodable {
    public init(email: String) {
        self.email = email
    }
    
    public let email: String
}
