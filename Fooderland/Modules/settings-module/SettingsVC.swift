//
//  SettingsVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 15.09.2022.
//

import UIKit
import FirebaseAuth
import ProgressHUD
final class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func orderStateButton(_ sender: Any) {
        performSegue(withIdentifier: "toOrderStateVC", sender: nil)
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            ProgressHUD.showSuccess("Çıkış başarılı")
            performSegue(withIdentifier: "toLoginVC", sender: nil)
        } catch  {
            ProgressHUD.showError("Çıkış başarısız")
        }
    }
}
