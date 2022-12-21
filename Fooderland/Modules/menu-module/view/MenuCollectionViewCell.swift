//
//  MenuCollectionViewCell.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 9.09.2022.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet private weak var foodNameLabel: UILabel!
    @IBOutlet private weak var foodPriceLabel: UILabel!
    
    func configureCell(with food: Food){
        foodPriceLabel.text = "\(food.price ?? "N/A") ₺"
        foodNameLabel.text = food.name
        //FIXME: image view
        layer.cornerRadius = 30
        backgroundColor = .cellBackgroundColor
        layer.borderWidth = 0.1
    }

}
