import Foundation

struct EditDiaryRequest: Codable {
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
