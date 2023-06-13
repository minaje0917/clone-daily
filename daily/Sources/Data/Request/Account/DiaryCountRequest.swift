import Foundation

struct DiaryCountRequest: Codable {
    let theme: String
    
    init(theme: String) {
        self.theme = theme
    }
}
