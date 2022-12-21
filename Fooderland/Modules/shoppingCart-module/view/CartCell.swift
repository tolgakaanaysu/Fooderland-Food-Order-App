//
//  TableViewCell.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 4.09.2022.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodQuantityLabel: UILabel!
    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var foodTotalLabel: UILabel!
    var shoppingCartPresenter: ViewToPresenterShoppingCartProtocol?
    var food: FoodCart?
    var totalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func customStepperButton(_ sender: UIButton) {
        var quantity = Int(foodQuantityLabel.text!)!
        var totalCostCart = Int(totalLabel.text!)!
        let price = Int(food!.price!)!
        
        switch sender.tag {
        case 1:
            if quantity > 1{
                quantity -= 1
                totalCostCart -= price
            }
            else {
                return
            }
            
        case 2:
           
            if quantity < 10{
                quantity += 1
                totalCostCart += price
            }
            else {
                return
            }
          
        default:
            break
        }
        
        foodQuantityLabel.text = String(quantity)
        let quantityStr = Int(foodQuantityLabel.text!)!
        let cost = price * quantityStr
        foodTotalLabel.text = String(cost) + " ₺"
        totalLabel!.text = String(totalCostCart)
        shoppingCartPresenter?.updateCart(food: food!, quantity: quantity)
        
       
        
        
    }
    

}
