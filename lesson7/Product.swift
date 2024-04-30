//
//  Product.swift
//  lesson7
//
//  Created by Даниил Евгеньевич on 19.04.2024.
//

import Foundation

class Product {
    let name: String
    let price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    func printInformation() {
        print(name)
        print(price)
    }
}
