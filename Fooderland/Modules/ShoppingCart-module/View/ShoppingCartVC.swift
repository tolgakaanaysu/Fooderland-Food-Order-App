//
//  ShoppingCartVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import UIKit
import ProgressHUD

final class ShoppingCartVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var sepetBosView: UIView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var totalCost: UILabel!
    @IBOutlet private weak var odemeYapButton: UIButton!
    @IBOutlet private weak var liraLabel: UILabel!
   
    //MARK: - Property
    var presenter: ShoppingCartPresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func clickedCheckoutButton(_ sender: Any) {
        presenter?.clickedCheckoutButton()
    }
    
    @IBAction func clickedTrashButton(_ sender: Any) {
        presenter?.clickedTrashButton()
    }
}

//MARK: -  UITableViewDataSource
extension ShoppingCartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _ = presenter?.cellForRowAt(at: indexPath.row),
         let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartCell else { return .init() }
        cell.presenter = presenter
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive,
                                        title: "Sil",
                                        handler: { [presenter] _,_,_ in
            presenter?.deleteFood(at: indexPath.row)
        })
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

//MARK: - ShoppingCartPresenterDelegate
extension ShoppingCartVC: ShoppingCartPresenterDelegate, CustomAlert {
    func cartIsEmpty(isEmpty: Bool) {
        tableView.isHidden = isEmpty
        navigationController?.isNavigationBarHidden = isEmpty
        totalCost.isHidden = isEmpty
        odemeYapButton.isHidden = isEmpty
        liraLabel.isHidden = isEmpty
        sepetBosView.isHidden = !isEmpty
    }
    
    func tableViewReloadData() {
        tableView.reloadData()
    }
    
    func prepareComponent() {
        tableView.dataSource = self
    }
    
    func startIndicator() {
        startProgressAnimating()
    }
    
    func stopIndicator() {
        stopAnimating()
    }
}

//TODO: Sepette ürünü unutunca bildirim bas - Scene Delegate
extension ShoppingCartVC {
    func createNotification(){
      
            let icerik = UNMutableNotificationContent()
            icerik.title = "Fooderland"
            icerik.subtitle = "Sepetinde ürün unuttun"
            icerik.body = "Sepetindeki ürünleri sipariş vermek ister misin"
            icerik.badge = (10) as NSNumber
            icerik.sound = UNNotificationSound.default
            
            // Bildirimler 1 dk altında tekrar gösterilmez
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi)
        
    }
}
