import Foundation
import Moya

enum DiaryServices {
    case write(authorization: String, date: String, param: WriteRequest)
    case detail(authorization: String, date: String)
}


extension DiaryServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case let .write(_,date,_), let .detail(_, date):
            return "/diary/\(date)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .write:
            return .post
        case .detail:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case let .write(_,_,param):
            return .requestJSONEncodable(param)
        case .detail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case let .write(authorization,_,_), let .detail(authorization,_):
            return["Content-Type" :"application/json","Authorization" : authorization]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}

