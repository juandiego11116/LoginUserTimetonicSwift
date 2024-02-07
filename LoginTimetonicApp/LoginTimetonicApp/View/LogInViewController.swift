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
        presenter = LoginPresenter(authRepository: AuthRepository(authDataSource: AuthApiService(apiClient: apiClient)))
        presenter.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: UIButton){
        presenter.loginPressed(email: emailTextfield.text, password: passwordTextfield.text)
    }
    
    func loginSuccess() {
        print("Login success")
    }
    
    func loginFailure(error: Error) {
        print("Login failure. Error: \(error.localizedDescription)")
    }
}

