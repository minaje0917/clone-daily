//
//  WriteDiaryRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct WriteDiaryRequest: Encodable {
    public init(date: Date, content: String, theme: ThemeType) {
        self.date = date
        self.content = content
        self.theme = theme
    }
    
    public let date: Date
    public let content: String
    public let theme: ThemeType
}
