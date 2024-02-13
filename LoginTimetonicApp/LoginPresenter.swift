import Foundation

/// A protocol for the delegate of the LoginPresenter to handle login success and failure events.
protocol LoginPresenterDelegate: AnyObject {
    
    /// Notifies the delegate about successful login with session key and o_u value.
    /// - Parameters:
    ///   - sessKey: The session key obtained during login.
    ///   - o_u: The o_u value obtained during login.
    func loginSuccess(sessKey: String, o_u: String)
    
    /// Notifies the delegate about login failure with the encountered error.
    /// - Parameter error: The error encountered during the login process.
    func loginFailure(error: Error)
}

/// A presenter responsible for handling the login logic and communicating with the authentication repository.
class LoginPresenter {
    
    /// The authentication repository instance used for login operations.
    private let authRepository: AuthRepository?
    
    /// The UserDefaults instance for storing session-related information.
    let defaults = UserDefaults.standard
    
    /// The session key obtained during login.
    private var sessKey: String?
    
    /// The o_u value obtained during login.
    private var o_u: String?
    
    /// The delegate to communicate login success or failure events.
    weak var delegate: LoginPresenterDelegate?
    
    /// Initializes the LoginPresenter with an authentication repository.
    /// - Parameter authRepository: The authentication repository instance.
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
        sessKey = defaults.string(forKey: Constants.UserDefaults.SESSION_KEY)
        o_u = defaults.string(forKey: Constants.AuthParameterName.O_U)
    }
    
    /// Handles the login button press event.
    /// - Parameters:
    ///   - email: The email entered by the user.
    ///   - password: The password entered by the user.
    func loginPressed(email: String?, password: String?) {
        guard let delegate = delegate,
              let email = email,
              let password = password,
              !email.isEmpty, !password.isEmpty else {
            
            let error = NSError(domain: Constants.Errors.DOMAIN, code: 0, userInfo: [NSLocalizedDescriptionKey: Constants.Errors.ERROR_MESSAGE])
            delegate?.loginFailure(error: error)
            return
        }
        if self.sessKey != nil &&  self.o_u != nil {
            delegate.loginSuccess(sessKey: self.sessKey ?? "nil", o_u: self.o_u ?? "nil")
        } else {
            authRepository?.createAppkey { [weak self] result in
                switch result {
                case .success(let appKeyModel):
                    self?.createOauthKey(email: email, password: password, appkey: appKeyModel.appkey)
                case .failure(let error):
                    self?.delegate?.loginFailure(error: error)
                }
            }
        }
    }
    
    /// Creates an OAuth key using the provided email, password, and app key.
    /// - Parameters:
    ///   - email: The email entered by the user.
    ///   - password: The password entered by the user.
    ///   - appkey: The application key obtained during app key creation.
    private func createOauthKey(email: String, password: String, appkey: String) {
        authRepository?.createOauthKey(logIn: email, password: password, appKey: appkey) { [weak self] result in
            switch result {
            case .success(let oauthKeyModel):
                self?.o_u = oauthKeyModel.o_u
                self?.createSessKey(o_u: oauthKeyModel.o_u, oauthkey: oauthKeyModel.oauthkey)
            case .failure(let error):
                self?.delegate?.loginFailure(error: error)
            }
        }
    }
    
    /// Creates a session key using the provided o_u and OAuth key.
    /// - Parameters:
    ///   - o_u: The o_u value obtained during OAuth key creation.
    ///   - oauthkey: The OAuth key obtained during OAuth key creation.
    private func createSessKey(o_u: String, oauthkey: String) {
        authRepository?.createSessKey(o_u: o_u, oauthkey: oauthkey) { [weak self] result in
            switch result {
            case .success(let sessKeyModel):
                self?.sessKey = sessKeyModel.sesskey
                self?.o_u = o_u
                self?.defaults.set(self?.sessKey, forKey: Constants.UserDefaults.SESSION_KEY)
                self?.defaults.set(self?.o_u, forKey: Constants.UserDefaults.SESSION_KEY)
                self?.delegate?.loginSuccess(sessKey: self?.sessKey ?? "nil", o_u: o_u )
            case .failure(let error):
                self?.delegate?.loginFailure(error: error)
            }
        }
    }
}
