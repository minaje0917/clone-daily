//
//  SignInViewModel.swift
//  daily
//
//  Created by 선민재 on 2022/10/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow
import Moya

final class SignInViewModel: BaseViewModel, Stepper {
    let keychain = Keychain()
    let authProvider = MoyaProvider<AuthServices>()
    var authData: LoginResponse?
    
    struct Input {
        let backSignUpButtonTap: Observable<Void>
        let forgotPwButtonTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transVC(input: Input) -> Output {
        input.backSignUpButtonTap.subscribe(
            onNext: pushCreateEmailVC
        ) .disposed(by: disposeBag)
        
        input.forgotPwButtonTap.subscribe(
            onNext: pushForgotPwVC
        ).disposed(by: disposeBag)
        return Output()
    }
    
    private func pushCreateEmailVC() {
        self.steps.accept(DailyStep.createEmailIsRequired)
    }
    
    private func pushForgotPwVC() {
        self.steps.accept(DailyStep.forgotPasswordIsRequired)
    }
}

extension SignInViewModel {
    func dailyLogin(email: String, password: String) {
        let param = LoginRequest(email: email, password: password)
        authProvider.request(.signIn(param: param)) { response in
            switch response {
            case .success(let result):
                print(String(data: result.data, encoding: .utf8))
                do {
                    self.authData = try result.map(LoginResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                let statusCode = result.statusCode
                switch statusCode{
                case 200..<300:
                    self.addKeychainToken()
                    self.steps.accept(DailyStep.mainTabBarIsRequired)
                default:
                    print("ERROR")
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
    
    func addKeychainToken() {
        self.keychain.create(
            key: Const.KeychainKey.accessToken,
            token: self.authData?.accessToken ?? ""
        )
        self.keychain.create(
            key: Const.KeychainKey.refreshToken,
            token: self.authData?.refreshToken ?? ""
        )
    }
}

