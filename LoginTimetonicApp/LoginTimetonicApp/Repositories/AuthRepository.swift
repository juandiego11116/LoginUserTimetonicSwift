//
//  APIService.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 24/01/24.
//

import Foundation

class AuthRepository {
    
    private let authDataSource: DataSourceProtocols
    
    init(authDataSource: DataSourceProtocols) {
        self.authDataSource = authDataSource
    }
    
    func createAppkey(completion: @escaping (Result<AppKeyModel, Error>) -> Void) {
        authDataSource.createAppKey() { result in
            completion(result)
        }
    }
    func createOauthKey(logIn: String, password: String, appKey: String, completion: @escaping (Result<OauthkeyModel, Error>) -> Void) {
        authDataSource.createOauthKey(login: logIn, password: password, appKey: appKey) { result in
            completion(result)
        }
    }
    
    func createSessKey(o_u: String, oauthkey: String, completion: @escaping (Result<SessKeyModel, Error>) -> Void) {
        authDataSource.createSessKey(o_u: o_u, oauthkey: oauthkey) { result in
            completion(result)
        }
    }
}
