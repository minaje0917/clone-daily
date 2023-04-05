//
//  DetailDiaryRequest.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct DetailDiaryRequest: Equatable {
    public init(date: Date) {
        self.date = date
    }
    public let date: Date
}
