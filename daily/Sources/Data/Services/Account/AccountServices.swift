import Foundation
import Moya

enum AccountServices {
    case diaryCount(authorization: String, theme: String)
}


extension AccountServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case let .diaryCount(_, theme):
            return "/account/theme-count/\(theme)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .diaryCount:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .diaryCount:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case let .diaryCount(authorization,_):
            return["Content-Type" :"application/json","Authorization" : authorization]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}
