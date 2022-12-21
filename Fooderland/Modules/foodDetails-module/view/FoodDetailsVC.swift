//
//  FoodDetailsVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import UIKit
import Kingfisher
class FoodDetailsVC: UIViewController {

    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var quantityStepper: UIStepper!
    @IBOutlet var foodQuantityLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    var food: Food?
    var foodIsFavorite: Bool?
    var detailsPresenter: ViewToPresenterFoodDetailsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodDetailsRouter.createModule(ref: self)
        
        guard let food = food else { return }
            
            let urlStr = "http://kasimadalan.pe.hu/yemekler/resimler/\(food.imageName!)"
            let url = URL(string: urlStr)
            foodImageView.kf.setImage(with: url)
            foodNameLabel.text = food.name
            foodPriceLabel.text = "\(food.price!) ₺"
        
    }
   
    
    //MARK: - Favorite Button
    @IBAction func favoriteButton(_ sender: Any) {
        
//        detailsPresenter?.addFavorite(food: food!)
    }
    
    //MARK: - Stepper
    @IBAction func quantityStepper(_ sender: UIStepper) {
        foodQuantityLabel.text = String(Int(sender.value))
    }
    
    //MARK: - Add To Shopping Cart
    @IBAction func addToShoppingCartButton(_ sender: Any) {
        guard let food = food else { return }
        
        if quantityStepper.value > 0 {
            self.dismiss(animated: true)
            let stepperValue = String(Int(quantityStepper.value))
            detailsPresenter?.addToShoppingCart(food: food,
                                                    food_quantity: stepperValue)
            quantityStepper.value = 0
            foodQuantityLabel.text = "0"
            
        }
        else {
            print("Sıfırdan büyük değer giriniz...")
        }
    }
}

extension FoodDetailsVC: PresenterToViewFoodDetailsProtocol {
    func isFavorite(_ isFavorite: Bool) {
        foodIsFavorite = isFavorite
        if foodIsFavorite! {
            favoriteButton.backgroundColor = .red
        }
        else {
            favoriteButton.backgroundColor = .white
        }
    }
}
