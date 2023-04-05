//
//  CheckAuthKeyRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct CheckAuthKeyRequest: Encodable {
    public init(authKey: Int) {
        self.authKey = authKey
    }
    
    public let authKey: Int
}
