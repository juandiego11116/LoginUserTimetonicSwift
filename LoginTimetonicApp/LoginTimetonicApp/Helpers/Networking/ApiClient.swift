//
//  ApiClient.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 28/01/24.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case post = "POST"
}

enum ApiError: Error {
    case invalidUrl
    case invalidResponse(statusCode: Int)
    case noData
    case decodingError(Error)
}

class ApiClient {
    
    func request<T: Decodable>(url: String, method: HTTPMethod, parameters: [String: Any]?, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, method: Alamofire.HTTPMethod(rawValue: method.rawValue), parameters: parameters)
            .validate()
            .response { response in
            switch response.result {
                case .success(let data):
                    if let data = data, !data.isEmpty {
                        let jsonString = String(data: data, encoding: .utf8)
                        do {
                            let decodedObject = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(decodedObject))
                        } catch let decodingError {
                            print("Decoding error: \(decodingError)")
                            completion(.failure(ApiError.decodingError(decodingError)))
                        }
                    } else {
                        completion(.failure(ApiError.noData))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

