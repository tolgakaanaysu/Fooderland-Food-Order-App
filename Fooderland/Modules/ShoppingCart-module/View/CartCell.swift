//
//  TableViewCell.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 4.09.2022.
//

import UIKit
import Kingfisher

final class CartCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet private weak var foodImageView: UIImageView!
    @IBOutlet private weak var foodNameLabel: UILabel!
    @IBOutlet private weak var foodQuantityLabel: UILabel!
    @IBOutlet private weak var foodPriceLabel: UILabel!
    @IBOutlet private weak var foodTotalLabel: UILabel!
    
    //MARK: - Proprty
    private var index: Int?
    var presenter: ShoppingCartPresenterProtocol?
    
    
    //MARK: - Lifecycle
    override func prepareForReuse() {
        foodImageView.image = nil
        foodNameLabel.text = ""
        foodQuantityLabel.text = ""
        foodPriceLabel.text = ""
    }
    
    //MARK: - IBActions
    @IBAction func stepperButtonClicked(_ sender: UIButton) {
        guard let stepperValue = foodQuantityLabel.text,
              var value = stepperValue.toInt(),
              let index else { return }
        
        //TODO: Set tag value to buttons
        switch sender.tag {
        case 0:
            value -= 1
            presenter?.clickedMinusButton(at: index)
        case 1:
            value += 1
            presenter?.clickedPlusButton(at: index)
        default:
            break
        }
        foodTotalLabel.text = value.toString()
    }
    
    //MARK: - Methods
    func configureCell(with food: FoodCart, index: Int) {
        self.index = index
        let url = Endpoint.shared.foodImage(with: food.imageName)
        foodImageView.kf.setImage(with: url)
        foodQuantityLabel.text = food.quaintity
        foodPriceLabel.text = food.price
        foodNameLabel.text = food.name
        foodTotalLabel.text = ( food.price.toInt()! * food.quaintity.toInt()! ).toString()
    }
}

