import Foundation

struct LoginModel: Codable {
    let data: LoginResponse
}

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpiredAt: String
    let refreshTokenExpiredAt: String
}
