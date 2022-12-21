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
    var registerPresenter: ViewToPresenterRegisterProtocol?
    
    @IBOutlet var usernameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterRouter.createModule(ref: self)
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        guard let email = userEmailLabel.text else { return }
        guard let password = userPasswordLabel.text else { return }
        guard let rePassword = userRepasswordLabel.text else { return }
        guard let username = usernameLabel.text else { return }
        
        if password == "" || email == "" || rePassword == "" || username == "" {
           ProgressHUD.showFailed("Email ve şifre boş olamaz")
            return
       }
        
        if password == rePassword {
            registerPresenter?.createUser(email: email, password: password, username: username)
        }
        else {
            ProgressHUD.showFailed("Şifreler eşleşmedi")
        }
        
        
    }
}

extension RegisterVC: PresenterToViewRegisterProtocol {
    func sendError(error: Error?) {
        if let error = error {
            ProgressHUD.showError("Kayıt başarısız")
            print(error.localizedDescription)
            print("Kayıt başarısız")
        } else {
            ProgressHUD.showSuccess("Kayıt başarılı")
            print("Kayıt başarılı")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                self.dismiss(animated: true)
            }
        }
    }
    
    
}

