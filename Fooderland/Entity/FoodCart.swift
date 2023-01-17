//
//  SepetYemekler.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import Foundation

struct FoodCart: Codable {
    var id: String
    var name: String
    var imageName: String
    var price: String
    var quaintity: String
    var username: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case imageName
        case price
        case quaintity
        case username
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? "N/A"
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "N/A"
        self.imageName = try container.decodeIfPresent(String.self, forKey: .imageName) ?? "N/A"
        self.price = try container.decodeIfPresent(String.self, forKey: .price) ?? "N/A"
        self.quaintity = try container.decodeIfPresent(String.self, forKey: .quaintity) ?? "N/A"
        self.username = try container.decodeIfPresent(String.self, forKey: .username) ?? "N/A"
    }
}
