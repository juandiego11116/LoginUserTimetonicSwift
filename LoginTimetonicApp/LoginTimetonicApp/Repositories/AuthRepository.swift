import Foundation

/// A repository class responsible for handling authentication-related data operations.
class AuthRepository {
    
    private let authDataSource: DataSourceProtocols
    
    /// Initializes the AuthRepository with a data source conforming to the DataSourceProtocols protocol.
    /// - Parameter authDataSource: An object conforming to the DataSourceProtocols protocol.
    init(authDataSource: DataSourceProtocols) {
        self.authDataSource = authDataSource
    }
    
    /// Creates an application key.
    /// - Parameter completion: A closure to be executed when the operation completes, containing a result of type `Result<AppKeyModel, Error>`.
    func createAppkey(completion: @escaping (Result<AppKeyModel, Error>) -> Void) {
        authDataSource.createAppKey() { result in
            completion(result)
        }
    }
    
    /// Creates an OAuth key.
    /// - Parameters:
    ///   - logIn: The login username.
    ///   - password: The user's password.
    ///   - appKey: The application key.
    ///   - completion: A closure to be executed when the operation completes, containing a result of type `Result<OauthkeyModel, Error>`.
    func createOauthKey(logIn: String, password: String, appKey: String, completion: @escaping (Result<OauthkeyModel, Error>) -> Void) {
        authDataSource.createOauthKey(login: logIn, password: password, appKey: appKey) { result in
            completion(result)
        }
    }
    
    /// Creates a session key.
    /// - Parameters:
    ///   - o_u: The user identifier.
    ///   - oauthkey: The OAuth key.
    ///   - completion: A closure to be executed when the operation completes, containing a result of type `Result<SessKeyModel, Error>`.
    func createSessKey(o_u: String, oauthkey: String, completion: @escaping (Result<SessKeyModel, Error>) -> Void) {
        authDataSource.createSessKey(o_u: o_u, oauthkey: oauthkey) { result in
            completion(result)
        }
    }
}
