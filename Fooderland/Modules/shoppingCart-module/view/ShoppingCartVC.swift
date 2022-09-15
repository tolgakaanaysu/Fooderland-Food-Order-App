//
//  ShoppingCartVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import UIKit
import Kingfisher
import ProgressHUD
class ShoppingCartVC: UIViewController {
    
    @IBOutlet var sepetBosView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalCost: UILabel!
    @IBOutlet var odemeYapButton: UIButton!
    @IBOutlet var liraLabel: UILabel!
    var shoppingCartPresenter: ViewToPresenterShoppingCartProtocol?
    var shoppingCartList: [SepetYemekler] = []
    var permision: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        ShoppingCartRouter.createModule(ref: self)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        shoppingCartPresenter?.getFoodInCart()
        totalCost.isHidden = true
        odemeYapButton.isHidden = true
        sepetBosView.isHidden = true
        liraLabel.isHidden = true
    }
    
  
    
    @IBAction func odemeYapButton(_ sender: Any) {
        performSegue(withIdentifier: "goToPaymentVC", sender: nil)
        
    }
    
    @IBAction func trashButton(_ sender: Any) {
        shoppingCartPresenter?.clearAllCart(list: shoppingCartList)
        
    }
}


//MARK: -  TABLEVİEW
extension ShoppingCartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = shoppingCartList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartCell
        cell.foodImageView.kf.setImage(with: takeImages(yemek_resim_adi: food.yemek_resim_adi!))
        cell.foodNameLabel.text = food.yemek_adi
        cell.foodQuantityLabel.text = food.yemek_siparis_adet
        cell.foodPriceLabel.text = food.yemek_fiyat! + " ₺"
        cell.food = food
        cell.shoppingCartPresenter = shoppingCartPresenter
        cell.totalLabel = totalCost
        let fiyat = Int(food.yemek_fiyat!)!
        let adet = Int(food.yemek_siparis_adet!)!
        cell.foodTotalLabel.text = "\(fiyat * adet) ₺"

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func takeImages(yemek_resim_adi: String) -> URL? {
        let urlStr = RESTAPI.yemekResimGetir + yemek_resim_adi
        let url = URL(string: urlStr)
        return url
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingCartList.count
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let food = shoppingCartList[indexPath.row]
        let delete = UIContextualAction(style: .destructive,
                                        title: "Sil",
                                        handler: {_,_,_ in self.shoppingCartPresenter?.deleteFoodInCart(sepet_yemek_id: food.sepet_yemek_id!)})
        return UISwipeActionsConfiguration(actions: [delete])
    }
}



//MARK: - Presenter Protocol
extension ShoppingCartVC: PresenterToViewShoppingCartProtocol {
    func sendTotalCost(total: String) {
        totalCost.text = total
    }
    
    func sendCartList(list: [SepetYemekler]) {
        shoppingCartList = list
        
        if shoppingCartList.count == 0 {
            sepetBosView.isHidden = false
            totalCost.isHidden = true
            odemeYapButton.isHidden = true
            liraLabel.isHidden = true
            
        }
        else {
            view.backgroundColor = .viewBackgroundColor
            sepetBosView.isHidden = true
            totalCost.isHidden = false
            odemeYapButton.isHidden = false
            liraLabel.isHidden = false
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}


extension ShoppingCartVC {
    func createNotification(){
      
            let icerik = UNMutableNotificationContent()
            icerik.title = "Fooderland"
            icerik.subtitle = "Sepetinde ürün unuttun"
            icerik.body = "Sepetindeki ürünleri sipariş vermek ister misin"
            icerik.badge = (shoppingCartList.count) as NSNumber
            icerik.sound = UNNotificationSound.default
            
            // Bildirimler 1 dk altında tekrar gösterilmez
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi)
        
    }
}
