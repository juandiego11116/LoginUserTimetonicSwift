//
//  AuthApiService.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 28/01/24.
//

import Foundation

class AuthApiService: DataSourceProtocols {
    
    private var apiClient = ApiClient()
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func createAppKey(completion: @escaping (Result<AppKeyModel, Error>) -> Void) {
        apiClient.request(
            url: Constants.Api.BASE_URL,
            method: .post,
            parameters: [
                Constants.AuthParameterName.VERSION: Constants.AuthParameter.VERSION,
                Constants.AuthParameterName.REQUEST: Constants.AuthParameter.REQUEST_APPKEY,
                Constants.AuthParameterName.APP_NAME: Constants.AuthParameter.APP_NAME
            ]
        ) { (result: Result<AppKeyModel, Error>) in
            completion(result)
        }
    }
    
    func createOauthKey(login: String, password: String, appKey: String, completion: @escaping (Result<OauthkeyModel, Error>) -> Void) {
        apiClient.request(
            url: Constants.Api.BASE_URL,
            method: .post,
            parameters: [
                Constants.AuthParameterName.VERSION: Constants.AuthParameter.VERSION,
                Constants.AuthParameterName.REQUEST: Constants.AuthParameter.REQUEST_OAUTHKEY,
                Constants.AuthParameterName.LOGIN: login,
                Constants.AuthParameterName.PASSWORD: password,
                Constants.AuthParameterName.APP_KEY: appKey
            ]
        ) { (result: Result<OauthkeyModel, Error>) in
            completion(result)
        }
    }
    
    func createSessKey(o_u: String, oauthkey: String, completion: @escaping (Result<SessKeyModel, Error>) -> Void) {
        apiClient.request(
            url: Constants.Api.BASE_URL,
            method: .post,
            parameters: [
                Constants.AuthParameterName.VERSION: Constants.AuthParameter.VERSION,
                Constants.AuthParameterName.REQUEST: Constants.AuthParameter.REQUEST_SESSKEY,
                Constants.AuthParameterName.O_U: o_u,
                Constants.AuthParameterName.U_C: o_u,
                Constants.AuthParameterName.OAUTH_KEY: oauthkey
            ]
        ) { (result: Result<SessKeyModel, Error>) in
            completion(result)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
