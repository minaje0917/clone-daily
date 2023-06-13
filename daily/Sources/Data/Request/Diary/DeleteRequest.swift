import Foundation

struct DeleteRequest: Codable {
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
