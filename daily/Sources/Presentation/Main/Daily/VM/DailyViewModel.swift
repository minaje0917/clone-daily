//
//  DailyViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/11/18.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow
import Moya

class DailyViewModel: BaseViewModel, Stepper{
    let keychain = Keychain()
    let diaryProvider = MoyaProvider<DiaryServices>()
    lazy var accessToken = "Bearer " + (keychain.read(key: Const.KeychainKey.accessToken) ?? "")

}

extension DailyViewModel {
    func diaryWrite(date: String, content:String, completion: @escaping () -> Void) {
        let param = WriteRequest(content: content, theme: "GRASSLAND")
        diaryProvider.request(.write(authorization: accessToken, date: date, param: param)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                print(self.accessToken)
                print(statusCode)
                switch statusCode{
                case 200..<300:
                    self.steps.accept(DailyStep.mainIsRequired)
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
        completion()
    }
}
