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
                    print("200")
                case 400:
                    self.steps.accept(DailyStep.failureAlert(
                        title: "오류!",
                        message: "일기 내용을 입력해주세요"
                    ))
                case 401:
                    print("401")
                case 409:
                    self.steps.accept(DailyStep.failureAlert(
                        title: "오류!",
                        message: "이미 일기를 작성한 날짜입니다."
                    ))
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
