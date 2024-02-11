import Foundation

/// A service class responsible for making API requests.
class ApiService: DataSourceProtocols {
    
    private var apiClient = ApiClient()
    
    /// Initializes the ApiService with an ApiClient instance.
    /// - Parameter apiClient: An ApiClient object used to make requests.
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    /// Creates an application key.
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
    
    /// Creates an OAuth key.
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
    
    /// Creates a session key.
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
    
    /// Retrieves all books.
    func getAllBooks(o_u: String, sessionKey: String, completion: @escaping (Result<GetAllBooksModel, Error>) -> Void) {
        apiClient.request(
            url: Constants.Api.BASE_URL,
            method: .post,
            parameters: [
                Constants.AuthParameterName.VERSION: Constants.AuthParameter.VERSION,
                Constants.AuthParameterName.REQUEST: Constants.BooksParameter.REQUEST_GET_BOOK,
                Constants.AuthParameterName.O_U: o_u,
                Constants.AuthParameterName.U_C: o_u,
                Constants.BooksParameter.SESSION_KEY: sessionKey
            ]
        ) { (result: Result<GetAllBooksModel, Error>) in
            completion(result)
        }
    }
}
