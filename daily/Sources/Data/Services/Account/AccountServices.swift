import Foundation
import Moya

enum AccountServices {
    case diaryCount(authorization: String, param: DiaryCountRequest)
}


extension AccountServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .diaryCount:
            return "/account/theme-count"
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
        case let .diaryCount(_,param):
            return .requestJSONEncodable(param)
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
