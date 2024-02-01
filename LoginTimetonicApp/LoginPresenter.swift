//
//  LoginPresenter.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 24/01/24.
//

import Foundation

protocol LoginPresenterDelegate: AnyObject {
    func loginSuccess()
    func loginFailure(error: Error)
}

class LoginPresenter{
    
    private let authRepository: AuthRepository?
    private var appKey: String?
    private var oauthkey: String?
    private var o_u: String?
    private var sessKey: String?
    weak var delegate: LoginPresenterDelegate?
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func loginPressed(email: String, password: String, completion: @escaping
                      (Result<CreateAppKeyModel, Error>) -> Void) {
        guard let delegate = delegate else {
            print("Error: Delegate not set.")
            return
        }
        
        authRepository?.createAppkey { [weak self] result in
            switch result {
            case .success(let appKeyModel):
                
                self?.appKey = appKeyModel.appkey
                
                self?.createOauthKey(email: email, password: password, completion: completion)
                
            case .failure(let error):
                self?.delegate?.loginFailure(error: error)
            }
        }
    }
    
    private func createOauthKey(email: String, password: String, completion: @escaping (Result<CreateAppKeyModel, Error>) -> Void) {
        
        authRepository?.createOauthKey(logIn: email, password: password, appKey: appKey! ) { [weak self] result in
            switch result {
            case .success(let oauthKeyModel):
                self?.oauthkey = oauthKeyModel.oauthkey
                self?.o_u = oauthKeyModel.o_u
                self?.createSessKey( completion: completion)
                
            case .failure(let error):
                self?.delegate?.loginFailure(error: error)
            }
        }
    }
    
    private func createSessKey( completion: @escaping (Result<CreateAppKeyModel, Error>) -> Void) {
        authRepository?.createSessKey(o_u: o_u ?? "nil", oauthkey: oauthkey ?? "nill") { [weak self] result in
            switch result {
            case .success(let sessKeyModel):
                self?.sessKey = sessKeyModel.sesskey
                //                implement view controller to Book
                self?.delegate?.loginSuccess()
                
            case .failure(let error):
                self?.delegate?.loginFailure(error: error)
            }
        }
    }
    
}



