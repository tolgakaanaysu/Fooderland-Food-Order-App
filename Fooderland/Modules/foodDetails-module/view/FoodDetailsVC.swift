//
//  FoodDetailsVC.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import UIKit
import Kingfisher

final class FoodDetailsVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var quantityStepper: UIStepper!
    @IBOutlet var foodQuantityLabel: UILabel!

    //MARK: - Property
    var presenter: FoodDetailsPresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
   
    //MARK: - Stepper
    @IBAction func quantityStepper(_ sender: UIStepper) {
        foodQuantityLabel.text = sender.value.toInt().toString()
    }
    
    //MARK: - Add To Shopping Cart
    @IBAction func addToShoppingCartButton(_ sender: Any) {
            let stepperValue = quantityStepper.value.toInt()
            presenter?.clickedAddToCart(value: stepperValue)
    }
}

//MARK: - FoodDetailsPresenterDelegate
extension FoodDetailsVC: FoodDetailsPresenterDelegate {
    func prepareComponent(with food: Food) {
        let url = Endpoint.shared.foodImage(with: food.imageName)
        print(url)
        foodImageView.kf.setImage(with: url,placeholder: UIImage(systemName: "star.fill"))
        foodNameLabel.text = food.name
        foodPriceLabel.text = food.price + " ₺"
    }
}
