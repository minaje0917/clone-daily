import Foundation

struct DiaryCountModel: Codable {
    let data: DiaryCountResponse
}

struct DiaryCountResponse: Codable {
    let count: Int
}
