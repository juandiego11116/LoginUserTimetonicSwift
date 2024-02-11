//
//  ViewController.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 22/01/24.
//

import UIKit
import PasswordTextField

protocol LoginViewControllable: AnyObject {
    func showResult(isSuccess: Bool, message: String)
}

class LoginViewController: UIViewController, LoginPresenterDelegate {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: PasswordTextField!
    
    var presenter: LoginPresenter!
    let apiClient = ApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(authRepository: AuthRepository(authDataSource: ApiService(apiClient: apiClient)))
        presenter.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: UIButton){
        presenter.loginPressed(email: emailTextfield.text, password: passwordTextfield.text)
    }
    
    func loginSuccess(sessKey: String, o_u: String) {
        DispatchQueue.main.async {
            let booksViewController = BooksViewController(nibName: Constants.BookElements.BOOKS_VIEW, bundle: nil)
            booksViewController.sessKey = sessKey
            booksViewController.o_u = o_u
            self.present(booksViewController, animated: true, completion: nil)
            print("Login success")
        }
    }
    
    func loginFailure(error: Error) {
        print("Login failure. Error: \(error.localizedDescription)")
    }
}

