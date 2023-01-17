//
//  Extensions.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 11.01.2023.
//

import Foundation

extension String {
    func toInt() -> Int? {
        guard let integer = Int(self) else { return nil }
        return integer
    }
}
