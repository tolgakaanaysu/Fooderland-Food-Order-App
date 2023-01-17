//
//  Alerty.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 11.01.2023.
//

import UIKit
import ProgressHUD

protocol CustomAlert {
    func showErrorAlert(message: String)
    func showSuccessAlert(message: String)
    func startProgressAnimating()
    func stopAnimating()
}

extension CustomAlert where Self: UIViewController {
    func showErrorAlert(message: String) {
        ProgressHUD.colorBackground = .lightGray
        ProgressHUD.colorStatus = .red
        ProgressHUD.showError(message)
        
    }
    
    func showSuccessAlert(message: String) {
        ProgressHUD.fontStatus = .boldSystemFont(ofSize: 30)
        ProgressHUD.colorBackground = .darkGray
        ProgressHUD.showSuccess(message)
       
    }
    
    func startProgressAnimating(){
        ProgressHUD.colorBackground = .lightGray
        ProgressHUD.colorAnimation = .blue
        ProgressHUD.animationType = .circleSpinFade
        ProgressHUD.show(interaction: false)
    }
        
    func stopAnimating(){
        ProgressHUD.dismiss()
    }
}
