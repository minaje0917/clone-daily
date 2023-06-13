//
//  ProfileViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/09.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow
import Moya

class ProfileViewModel: BaseViewModel, Stepper{
    let keychain = Keychain()
    let profileProvider = MoyaProvider<ProfileServices>()
    let detailProvider = MoyaProvider<DiaryServices>()
    lazy var accessToken = "Bearer " + (keychain.read(key: Const.KeychainKey.accessToken) ?? "")
    var diaryData: DiaryDetailResponse?
    var listData: [GetDiaryListResponse] = []

}

extension ProfileViewModel {
    func getDiaryList(completion: @escaping () -> Void) {
        profileProvider.request(.getDiaryList(authorization: accessToken)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                do {
                    self.listData = try result.map([GetDiaryListResponse].self)
                    print(self.listData)
                    completion()
                }catch(let err) {
                    print(String(describing: err))
                }
                switch statusCode{
                case 200..<300:
                    print("200")
                case 400:
                    print("400")
                case 401:
                    print("401")
                case 409:
                    print("409")
                default:
                    print("ERROR")
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
    
    func getDiaryDetail(date: String, completion: @escaping () -> Void) {
        detailProvider.request(.detail(authorization: accessToken, date: date)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                do {
                    self.diaryData = try result.map(DiaryDetailResponse.self)
                    print(self.diaryData ?? "")
                    completion()
                }catch(let err) {
                    print(String(describing: err))
                }
                switch statusCode{
                case 200..<300:
                    print("200")
                case 400:
                    print("400")
                case 401:
                    print("401")
                case 409:
                    print("409")
                default:
                    print("ERROR")
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
}
