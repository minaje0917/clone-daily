//
//  ThemeViewModel.swift
//  daily
//
//  Created by 선민재 on 2023/03/09.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow
import Moya

class ThemeViewModel: BaseViewModel, Stepper{
    let keychain = Keychain()
    let accountProvider = MoyaProvider<AccountServices>()
    lazy var accessToken = "Bearer " + (keychain.read(key: Const.KeychainKey.accessToken) ?? "")
    var diaryCount: DiaryCountResponse?
    
    struct Input {
        let xmarkButtonDidTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) {
        input.xmarkButtonDidTap.subscribe(
            onNext: pushHomeVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushHomeVC() {
        self.steps.accept(DailyStep.mainTabBarIsRequired)
    }
}

extension ThemeViewModel {
    func getDiaryCount() {
        accountProvider.request(.diaryCount(authorization: accessToken, theme: "GRASSLAND")) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                print(statusCode)
                do {
                    self.diaryCount = try result.map(DiaryCountResponse.self)
                    print(self.diaryCount)
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
