//
//  LoginPresenter.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 24/01/24.
//

import Foundation

protocol LoginPresenterDelegate: AnyObject {
    func loginSuccess(sessKey: String, o_u: String)
    func loginFailure(error: Error)
}

class LoginPresenter{
    
    private let authRepository: AuthRepository?
    let defauls = UserDefaults.standard
    private var sessKey: String?
    private var o_u: String?
    weak var delegate: LoginPresenterDelegate?
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
        sessKey = defauls.string(forKey: Constants.userDefaulds.SESSION_KEY)
        o_u = defauls.string(forKey: Constants.AuthParameterName.O_U)
    }
    
    func loginPressed(email: String?, password: String?) {
        guard let delegate = delegate,
              let email = email,
              let password = password,
              !email.isEmpty, !password.isEmpty else {
            print("Error: Delegate not set or empty email/password.")
            return
        }
        if self.sessKey != nil &&  self.o_u != nil{
            delegate.loginSuccess(sessKey: self.sessKey ?? "nil", o_u: self.o_u ?? "nil")
        } else {
            authRepository?.createAppkey { [weak self] result in
                switch result {
                case .success(let appKeyModel):
                    self?.createOauthKey(email: email, password: password, appkey: appKeyModel.appkey)
                case .failure(let error):
                    self?.delegate?.loginFailure(error: error)
                }
            }
        }
    }
    
    private func createOauthKey(email: String, password: String, appkey: String) {
        authRepository?.createOauthKey(logIn: email, password: password, appKey: appkey) { [weak self] result in
            switch result {
            case .success(let oauthKeyModel):
                self?.o_u = oauthKeyModel.o_u
                self?.createSessKey(o_u: oauthKeyModel.o_u, oauthkey: oauthKeyModel.oauthkey)
            case .failure(let error):
                self?.delegate?.loginFailure(error: error)
            }
        }
    }
    
    private func createSessKey(o_u: String, oauthkey: String) {
        authRepository?.createSessKey(o_u: o_u, oauthkey: oauthkey) { [weak self] result in
            switch result {
            case .success(let sessKeyModel):
                self?.sessKey = sessKeyModel.sesskey
                self?.o_u = o_u
                self?.defauls.set(self?.sessKey, forKey: Constants.userDefaulds.SESSION_KEY)
                self?.defauls.set(self?.o_u, forKey: Constants.userDefaulds.SESSION_KEY)
                self?.delegate?.loginSuccess(sessKey: self?.sessKey ?? "nil", o_u: o_u )
            case .failure(let error):
                self?.delegate?.loginFailure(error: error)
            }
        }
    }
}



