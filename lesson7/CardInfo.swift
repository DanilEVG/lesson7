//
//  PaymentInfo.swift
//  lesson7
//
//  Created by Даниил Евгеньевич on 19.04.2024.
//

import Foundation

struct CardInfo {
    var cardNumber: String
    var owner: String
    var cvvCode: String
    var balanceCard: Double
    
    init(owner: String) {
        self.cardNumber = String(Int.random(in: 1000...9999))
        self.owner = owner
        self.cvvCode = String(Int.random(in: 100...999))
        self.balanceCard = Double.random(in: 200...1000)
        
    }
    
}
