//
//  RegisterVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 14.09.2022.
//

import UIKit
import ProgressHUD

class RegisterVC: UIViewController {
    
    
    @IBOutlet var userEmailLabel: UITextField!
    @IBOutlet var userPasswordLabel: UITextField!
    @IBOutlet var userRepasswordLabel: UITextField!
    var registerPresenter: ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterRouter.createModule(ref: self)
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        guard let email = userEmailLabel.text else { return }
        guard let password = userPasswordLabel.text else { return }
        guard let rePassword = userRepasswordLabel.text else { return }
        
        if password == "" || email == "" || rePassword == "" {
           ProgressHUD.showFailed("Email ve şifre boş olamaz")
            return
       }
        
        if password == rePassword {
            registerPresenter?.createUser(email: email, password: password)
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

