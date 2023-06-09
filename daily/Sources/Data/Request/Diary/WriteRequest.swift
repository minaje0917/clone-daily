import Foundation

struct WriteRequest: Codable {
    let content: String
    let theme: String
    
    init(content: String, theme: String) {
        self.content = content
        self.theme = theme
    }
}
