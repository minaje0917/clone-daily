//
//  CheckThemeResponse.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct CheckThemeResponse: Encodable {
    public init(theme: [String]) {
        self.theme = theme
    }
    
    public let theme: [String]
}
