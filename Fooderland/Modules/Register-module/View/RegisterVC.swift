//
//  RegisterVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 14.09.2022.
//

import UIKit
import ProgressHUD

final class RegisterVC: UIViewController {
    @IBOutlet private weak var userEmailLabel: UITextField!
    @IBOutlet private weak var userPasswordLabel: UITextField!
    @IBOutlet private weak var userRepasswordLabel: UITextField!
    @IBOutlet private weak var usernameLabel: UITextField!
    
    var presenter: RegisterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        guard let email = userEmailLabel.text,
              let password = userPasswordLabel.text,
              let rePassword = userRepasswordLabel.text,
              let username = usernameLabel.text else { return }
        
        if password.isEmpty || email.isEmpty || rePassword.isEmpty || username.isEmpty {
            ProgressHUD.showFailed("Email ve şifre boş olamaz")
            return
        }
        
        if password == rePassword {
            presenter?.createUser(email: email, password: password, username: username)
        }
        else {
            ProgressHUD.showFailed("Şifreler eşleşmedi")
        }
    }
}

extension RegisterVC: RegisterPresnterDelegate, CustomAlert {
    func showErrorMessage(message: String) {
        showErrorAlert(message: message)
    }
    
    func showSuccessMessage(message: String) {
        showSuccessAlert(message: message)
    }
}
