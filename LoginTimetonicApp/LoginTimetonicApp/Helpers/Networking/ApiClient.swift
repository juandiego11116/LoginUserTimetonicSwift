import Foundation
import Alamofire

/// Enum representing HTTP request methods.
enum HTTPMethod: String {
    case post = "POST"
}

/// Enum representing possible errors that can occur during API requests.
enum ApiError: Error {
    case invalidUrl
    case invalidResponse(statusCode: Int)
    case noData
    case decodingError(Error)
}

/// Class responsible for making API requests using Alamofire.
class ApiClient {
    
    /// Sends an HTTP request to the specified URL.
    /// - Parameters:
    ///   - url: The URL to send the request to.
    ///   - method: The HTTP method for the request.
    ///   - parameters: Optional parameters to include in the request body.
    ///   - completion: A closure to be executed when the request finishes.
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


