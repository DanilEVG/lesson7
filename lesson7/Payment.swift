//
//  Payment.swift
//  lesson7
//
//  Created by Даниил Евгеньевич on 23.04.2024.
//

import Foundation

class Payment {
    var balanceCash = Double.random(in: 200...1000)
    var card: CardInfo
    
    
    init(card: CardInfo) {
        self.card = card
    }
    
    func lock(sum: Double, from paymentMethod: PaymentMethod) -> Bool{
        switch paymentMethod {
        case .card:
            return checkBalance(sum: sum, balance: card.balanceCard)
        case .cash:
            return checkBalance(sum: sum, balance: balanceCash)
        }
    }
    
    func pay(sum: Double, paymentMethod: PaymentMethod){
        switch paymentMethod {
        case .card:
            payCard(sum: sum)
        case .cash:
            payCash(sum: sum)
        }
    }
    
    func payCash(sum: Double) {
        balanceCash -= sum
    }
    
    func payCard(sum: Double) {
        card.balanceCard -= sum
    }
    
    func checkBalance(sum: Double, balance: Double) -> Bool {
        print("Сумма: \(sum), баланс \(balance)")
        return balance >= sum ? true : false
    }
    
    
}
