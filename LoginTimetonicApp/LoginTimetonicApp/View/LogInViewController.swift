//
//  ViewController.swift
//  LoginTimetonicApp
//
//  Created by Leidy Luna on 22/01/24.
//

import UIKit
import PasswordTextField

protocol LoginView: AnyObject {
    func showResult(isSuccess: Bool, message: String)
}

class LogInViewController: UIViewController, LoginPresenterDelegate {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: PasswordTextField!
    
    var presenter: LoginPresenter!
    let apiClient = ApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(authRepository: AuthRepository(authDataSource: AuthApiService(apiClient: apiClient)))
        presenter.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: UIButton){
        guard let email = emailTextfield.text,
              let password = passwordTextfield.text else {
            return
        }
        presenter.loginPressed(email: email, password: password) { result in
            switch result {
            case .success(_):
                self.loginSuccess()
            case .failure(let error):
                self.loginFailure(error: error)
            }
        }
    }
    
    func loginSuccess() {
        print("Login success")
    }
    
    func loginFailure(error: Error) {
        print("Login failure. Error: \(error.localizedDescription)")
    }
    
    
    
}

