//
//  ThemeCountResponse.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct ThemeCountResponse: Encodable {
    public init(count: Int) {
        self.count = count
    }
    
    public let count: Int
}
