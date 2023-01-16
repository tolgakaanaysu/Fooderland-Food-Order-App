//
//  Optional+Extension.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 15.01.2023.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
