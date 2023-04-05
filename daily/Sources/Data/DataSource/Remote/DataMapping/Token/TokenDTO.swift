//
//  TokenDTO.swift
//  daily
//
//  Created by 선민재 on 2023/04/05.
//

import Foundation

struct TokenDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpriedAt: String
}
