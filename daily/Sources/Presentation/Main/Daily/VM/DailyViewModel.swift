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
    func dailyWrite(date: Date, content:String) {
        let param = WriteRequest(content: content, theme: "GRASSLAND")
        diaryProvider.request(.write(authorization: accessToken, date: date, param: param)) { response in
            switch response {
            case .success(let result):
                print(String(data: result.data, encoding: .utf8))
                let statusCode = result.statusCode
                switch statusCode{
                case 200..<300:
                    self.steps.accept(DailyStep.mainTabBarIsRequired)
                default:
                    print("ERROR")
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
