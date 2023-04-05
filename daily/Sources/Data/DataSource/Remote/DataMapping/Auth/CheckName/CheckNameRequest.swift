//
//  CheckNameRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct CheckNameRequest: Encodable {
    public init(name: String) {
        self.name = name
    }

    public let name: String
}
