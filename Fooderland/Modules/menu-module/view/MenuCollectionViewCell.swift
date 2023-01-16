//
//  MenuCollectionViewCell.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 9.09.2022.
//

import UIKit
import Kingfisher
final class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet private weak var foodNameLabel: UILabel!
    @IBOutlet private weak var foodPriceLabel: UILabel!
    
    func configureCell(with food: Food) {
        foodPriceLabel.text = food.price + " ₺"
        foodNameLabel.text = food.name
        //FIXME: image view
        foodImageView.kf.setImage(with: Endpoint.shared.foodImage(with: food.imageName), placeholder: UIImage(systemName: "star"))
        layer.cornerRadius = 30
        backgroundColor = .cellBackgroundColor
        layer.borderWidth = 0.1
    }
}
