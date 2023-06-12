import Foundation
import Moya

enum ProfileServices {
    case getDiaryList(authorization: String)
}


extension ProfileServices: TargetType {
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case let .getDiaryList:
            return "/diary"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDiaryList:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .getDiaryList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case let .getDiaryList(authorization):
            return["Content-Type" :"application/json","Authorization" : authorization]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}

