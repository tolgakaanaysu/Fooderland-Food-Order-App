//
//  Yemekler.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 1.09.2022.
//

import Foundation

struct Food: Codable {
    var id: String
    var name: String
    var imageName: String
    var price: String
    
    enum CodingKeys: String, CodingKey {
        case id = "yemek_id"
        case name = "yemek_adi"
        case imageName = "yemek_resim_adi"
        case price = "yemek_fiyat"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? "N/A"
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "N/A"
        self.imageName = try container.decodeIfPresent(String.self, forKey: .imageName) ?? "N/A"
        self.price = try container.decodeIfPresent(String.self, forKey: .price) ?? "N/A"
    }
}
