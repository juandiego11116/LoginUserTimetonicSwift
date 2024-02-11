//
//  AuthDataSource.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 28/01/24.
//

import Foundation


protocol DataSourceProtocols {
    func createAppKey(completion: @escaping (Result<AppKeyModel, Error>) -> Void)
    
    func createOauthKey(login: String, password: String, appKey: String, completion: @escaping (Result<OauthkeyModel, Error>) -> Void)
    
    func createSessKey(o_u: String, oauthkey: String, completion: @escaping (Result<SessKeyModel, Error>) -> Void)
    
    func getAllBooks(o_u: String, sessionKey: String, completion: @escaping (Result<GetAllBooksModel, Error>) -> Void)
}
