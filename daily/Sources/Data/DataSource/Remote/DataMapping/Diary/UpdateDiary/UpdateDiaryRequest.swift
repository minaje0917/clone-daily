//
//  UpdateDiaryRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct UpdateDiaryRequest: Equatable {
    public init(date: Date, content: String) {
        self.date = date
        self.content = content
    }
    
    public let date: Date
    public let content: String
}
