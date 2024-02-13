import UIKit
import PasswordTextField

/// A protocol defining methods for controlling the login view.
protocol LoginViewControllable: AnyObject {
    /// Displays the result of the login attempt.
    /// - Parameters:
    ///   - isSuccess: A boolean value indicating whether the login attempt was successful.
    ///   - message: A message describing the result of the login attempt.
    func showResult(isSuccess: Bool, message: String)
}

/// A view controller responsible for handling the login process.
class LoginViewController: UIViewController, LoginPresenterDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: PasswordTextField!
    
    // MARK: - Properties
    
    var presenter: LoginPresenter!
    let apiClient = ApiClient()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(authRepository: AuthRepository(authDataSource: ApiService(apiClient: apiClient)))
        presenter.delegate = self
        
        presenter.loginPressed(email: emailTextfield.text, password: passwordTextfield.text)
    }
    
    // MARK: - IBActions
    
    /// Triggered when the login button is pressed.
    @IBAction func loginPressed(_ sender: UIButton) {
        presenter.loginPressed(email: emailTextfield.text, password: passwordTextfield.text)
    }
    
    // MARK: - LoginPresenterDelegate
    
    func loginSuccess(sessKey: String, o_u: String) {
        DispatchQueue.main.async {
            let booksViewController = BooksViewController(nibName: Constants.BookElements.BOOKS_VIEW, bundle: nil)
            booksViewController.sessKey = sessKey
            booksViewController.o_u = o_u
            self.present(booksViewController, animated: true, completion: nil)
        }
    }
    
    func loginFailure(error: Error) {
        let alertController = UIAlertController(title: "Login Failure", message: error.localizedDescription, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
    }
}
