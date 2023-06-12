import Foundation

struct GetDiaryListModel: Codable {
    let data: GetDiaryListResponse
}

struct GetDiaryListResponse: Codable {
    let content: String
    let date: String
}
