//
//  ChoiceThemeRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct ChoiceRequest: Encodable{
    public init(theme: ThemeType) {
        self.theme = theme
    }
    
    public let theme: ThemeType
}
