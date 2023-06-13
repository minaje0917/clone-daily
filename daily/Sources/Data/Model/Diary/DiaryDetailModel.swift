import Foundation

struct DiaryDetailModel: Codable {
    let data: DiaryDetailResponse
}

struct DiaryDetailResponse: Codable {
    let content: String
}
