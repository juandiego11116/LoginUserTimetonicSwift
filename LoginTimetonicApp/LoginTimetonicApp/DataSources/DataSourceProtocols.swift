import Foundation

/// A protocol defining methods for interacting with various data sources.
protocol DataSourceProtocols {
    
    /// Creates an application key.
    /// - Parameter completion: A closure to be executed when the operation completes. It takes a result containing either an `AppKeyModel` or an `Error`.
    func createAppKey(completion: @escaping (Result<AppKeyModel, Error>) -> Void)
    
    /// Creates an OAuth key.
    /// - Parameters:
    ///   - login: The user's login.
    ///   - password: The user's password.
    ///   - appKey: The application key.
    ///   - completion: A closure to be executed when the operation completes. It takes a result containing either an `OauthkeyModel` or an `Error`.
    func createOauthKey(login: String, password: String, appKey: String, completion: @escaping (Result<OauthkeyModel, Error>) -> Void)
    
    /// Creates a session key.
    /// - Parameters:
    ///   - o_u: The user's identifier.
    ///   - oauthkey: The OAuth key.
    ///   - completion: A closure to be executed when the operation completes. It takes a result containing either a `SessKeyModel` or an `Error`.
    func createSessKey(o_u: String, oauthkey: String, completion: @escaping (Result<SessKeyModel, Error>) -> Void)
    
    /// Retrieves all books.
    /// - Parameters:
    ///   - o_u: The user's identifier.
    ///   - sessionKey: The session key.
    ///   - completion: A closure to be executed when the operation completes. It takes a result containing either a `GetAllBooksModel` or an `Error`.
    func getAllBooks(o_u: String, sessionKey: String, completion: @escaping (Result<GetAllBooksModel, Error>) -> Void)
}
