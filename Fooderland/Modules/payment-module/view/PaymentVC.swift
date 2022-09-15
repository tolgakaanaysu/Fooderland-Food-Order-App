//
//  PaymentVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 14.09.2022.
//

import UIKit
import ProgressHUD
class PaymentVC: UIViewController {

    @IBOutlet var creditCardLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var cvcLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = .white
    
    }


    @IBAction func textFields(_ sender: UITextField) {
        switch sender.tag {
        case 1:
            nameLabel.text =  sender.text
        case 2:
            creditCardLabel.text = sender.text
        case 3:
            dateLabel.text = sender.text
        case 4:
            cvcLabel.text = sender.text
        default:
            break
        }
    }
    
    
    @IBAction func odemeyiTamamla(_ sender: Any) {
        ProgressHUD.showSuccess("Ödemeniz onaylandı... Siparişiniz birkaç dakika içinde kapınızda..")
//        Thread.sleep(forTimeInterval: 2)
        performSegue(withIdentifier: "goToOrderStateVC", sender: nil)
//        navigationItem.backBarButtonItem?.isEnabled = false
     
      
    }
    
}
