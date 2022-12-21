//
//  LoginVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 13.09.2022.
//

import UIKit
import ProgressHUD
import FirebaseAuth
final class LoginVC: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    var loginPresenter: ViewToPresenterLoginProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginRouter.createModule(ref: self)

    }
    override func viewDidDisappear(_ animated: Bool) {
        let username = Auth.auth().currentUser?.displayName
        print(username ?? "Kullancı adı alınamadı")
    }
    @IBAction func enterButton(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        if password == "" || email == "" {
           ProgressHUD.showError("Email ve şifre boş olamaz")
            return
       }
  
        loginPresenter?.signIn(email: email, password: password)
        
        
    }
    
    @IBAction func toRegisterVC(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterVC", sender: nil)
    }
}

extension LoginVC: PresenterToViewLoginProtocol {
    func sendError(error: Error?) {
        
        if let error = error {
            ProgressHUD.showError("Giriş başarısız")
            print(error.localizedDescription)
            print("giriş başarısız")
        } else {
            ProgressHUD.showSuccess("Giriş başarılı")
            print("giriş başarılı")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.performSegue(withIdentifier: "goToMenuVC", sender: nil)
                self.loginPresenter?.getUsername()
            }
           
        }
    }
}
