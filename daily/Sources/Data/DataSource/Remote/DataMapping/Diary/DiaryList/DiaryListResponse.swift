//
//  DiaryListResponse.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

public struct DiaryListResponse: Decodable {
    let diaryList: [DiaryResponse]

    struct DiaryResponse: Decodable {
        let content: String
        let date: Date
    }
}
