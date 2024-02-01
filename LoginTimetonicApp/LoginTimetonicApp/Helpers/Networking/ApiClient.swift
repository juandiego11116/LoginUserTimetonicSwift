//
//  ApiClient.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 28/01/24.
//

import Foundation


enum HTTPMethod: String {
    case post = "POST"
}

class ApiClient {
    
    func request<T: Decodable>(url: String, method: HTTPMethod, parameters: [String: Any]?, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard var urlComponents = URLComponents(string: url) else {
            completion(.failure(ApiError.invalidUrl))
            return
        }
        if let parameters = parameters {
            let queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
            urlComponents.queryItems = queryItems
        }
        guard let apiUrl = urlComponents.url else {
            completion(.failure(ApiError.invalidUrl))
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
                
            case .post:
                request.httpBody = try? JSONSerialization.data(withJSONObject: params)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ApiError.invalidResponse(statusCode: -1)))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ApiError.invalidResponse(statusCode: httpResponse.statusCode)))
                return
            }
            
            if let data = data, !data.isEmpty {
                let jsonString = String(data: data, encoding: .utf8)
                print("Response JSON string: \(jsonString ?? "No data")")
                
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
        }
        task.resume()
    }
}

enum ApiError: Error {
    case invalidUrl
    case invalidResponse(statusCode: Int)
    case noData
    case decodingError(Error)
}
