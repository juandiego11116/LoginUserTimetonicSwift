//
//  APIService.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 24/01/24.
//

import Foundation

class AuthRepository {
    private let authDataSource: AuthDataSource
    
    init(authDataSource: AuthDataSource) {
        self.authDataSource = authDataSource
    }
    
    func createAppkey(completion: @escaping (Result<CreateAppKeyModel, Error>) -> Void) {
        authDataSource.createAppKey() { result in
            completion(result)
        }
    }
    func createOauthKey(logIn: String, password: String, appKey: String, completion: @escaping (Result<CreateOauthkeyModel, Error>) -> Void) {
        authDataSource.createOauthKey(logIn: logIn, pwd: password, appKey: appKey) { result in
            completion(result)
        }
    }
    
    func createSessKey(o_u: String, oauthkey: String, completion: @escaping (Result<CreateSessKeyModel, Error>) -> Void) {
        authDataSource.createSessKey(o_u: o_u, oauthkey: oauthkey) { result in
            completion(result)
        }
    }
}
