//
//  Cashier.swift
//  lesson7
//
//  Created by Даниил Евгеньевич on 23.04.2024.
//

import Foundation

class Cashier {
    
    var number: Int
    init(number: Int) {
        self.number = number
    }
    //выручка кассы за день
    var subTotal = 0.0
    
    //совершение продажи
    func processBuyer(buyer: Buyer, paymentMethod: PaymentMethod) -> [(product: Product,count: Int)]?{
        let total = calculateOrderAmount(from: buyer)
        if buyer.payment.lock(sum: total, from: paymentMethod) {
            subTotal += total
            buyer.payment.pay(sum: total, paymentMethod: paymentMethod)
            return buyer.bucket
        } else {
            print("Недостаточно средств")
            
            
            return nil
        }
        
    }
    
    func calculateOrderAmount(from buyer: Buyer) -> Double {
        buyer.bucket.reduce(0) { $0 + $1.product.price * Double($1.count)}
    }
    
    func isFree() -> Bool {
        Bool.random()
    }
    
}
