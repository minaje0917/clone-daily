import Foundation
import Moya

enum DiaryServices {
    case write(authorization: String, date: Date)
}


extension DiaryServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case let .write(_,date):
            return "/diary/\(date)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .write:
            return .post
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .write:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case let .write(authorization,_):
            return["Content-Type" :"application/json","Authorization" : authorization]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}

