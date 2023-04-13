//
//  Diary.swift
//  daily
//
//  Created by 선민재 on 2023/04/04.
//

import Foundation

public struct Diary {
    public init(date: Date, content: String, theme: ThemeType, season: SeasonType){
        self.date = date
        self.content = content
        self.theme = theme
        self.season = season
    }
    
    public let date: Date
    public let content: String
    public let theme: ThemeType
    public let season: SeasonType
    
}
