//
//  AuthApiService.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 28/01/24.
//

import Foundation

class AuthApiService: AuthDataSource {
    
    private var apiClient = ApiClient()
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func createAppKey( completion: @escaping (Result<CreateAppKeyModel, Error>) -> Void) {
        apiClient.request(
            url: Constants.Api.baseUrl,
            method: .post,
            parameters: [
                "version": Constants.Auth.version,
                "req": Constants.Auth.requestAppKey,
                "appname": Constants.Auth.appName
            ]
        ) { (result: Result<CreateAppKeyModel, Error>) in
            completion(result)
        }
    }
    
    func createOauthKey( logIn: String, pwd: String, appKey: String, completion: @escaping (Result<CreateOauthkeyModel, Error>) -> Void) {
        apiClient.request(
            url: Constants.Api.baseUrl,
            method: .post,
            parameters: [
                "version": Constants.Auth.version,
                "req": Constants.Auth.requestOauthKey,
                "login": logIn,
                "pwd": pwd,
                "appkey": appKey
            ]
        ) { (result: Result<CreateOauthkeyModel, Error>) in
            completion(result)
        }
    }
    
    func createSessKey( o_u: String, oauthkey: String, completion: @escaping (Result<CreateSessKeyModel, Error>) -> Void) {
        apiClient.request(
            url: Constants.Api.baseUrl,
            method: .post,
            parameters: [
                "version": Constants.Auth.version,
                "req": Constants.Auth.requestSessKey,
                "o_u": o_u,
                "u_c": o_u,
                "oauthkey": oauthkey
            ]
        ) { (result: Result<CreateSessKeyModel, Error>) in
            completion(result)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
