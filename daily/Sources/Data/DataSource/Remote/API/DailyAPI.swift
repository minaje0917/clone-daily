//
//  DailyAPI.swift
//  daily
//
//  Created by 선민재 on 2023/03/08.
//

import Moya
import Foundation

protocol DailyAPI: TargetType {
    associatedtype ErrorType: Error
    var domain: DailyDomain { get }
    var urlPath: String { get }
    var errorMapper: [Int: ErrorType]? { get }
}

extension DailyAPI {
    
    var baseURL: URL {
        return (URL(string: "https://port-0-daily-server-v4-r8xoo2mlef98yij.sel3.cloudtype.app/")) ??
        URL(string: "https://www.naver.com")!
    }
    
    var path: String {
        domain.url + urlPath
    }
    
    var headers: [String: String]? {
        switch self {

        default:
            return ["Content-Type": "application/json"]
        }
    }
}

enum DailyDomain: String {
    case account
    case auth
    case diary
    case email
}

extension DailyDomain {
    var url: String {
        return "/\(self.rawValue)"
    }
}
