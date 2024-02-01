//
//  AuthDataSource.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 28/01/24.
//

import Foundation


protocol AuthDataSource {
    func createAppKey(completion: @escaping (Result<CreateAppKeyModel, Error>) -> Void)
    
    func createOauthKey( logIn: String, pwd: String, appKey: String, completion: @escaping (Result<CreateOauthkeyModel, Error>) -> Void)
    
    func createSessKey( o_u: String, oauthkey: String, completion: @escaping (Result<CreateSessKeyModel, Error>) -> Void)
}
