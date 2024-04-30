//
//  Buyer.swift
//  lesson7
//
//  Created by Даниил Евгеньевич on 19.04.2024.
//

import Foundation

class Buyer {
    let name: String
    var bucket: [(product: Product,count: Int)] = []
    let payment: Payment
    
    init(name: String) {
        self.name = name
        self.payment = Payment(card: CardInfo(owner: name))
    }
    
    func takeProduct(named name: String, count: Int, from shop: Shop) {
        /*
        let product = shop.products.first { p in
            p.name == name
        }
        guard let product else {
            return
        }
         */
        //shop.retreiveProduct(product)
        guard let product = shop.getProduct(name: name, count: count) else { return }
        if bucket.isEmpty {
            shop.buyers.append(self)
        }
        bucket.append((product: product, count: count))
        
    }
    
    func printBucket() {
        print("В корзине у \(name):")
        bucket.map{print("Продукт: \($0.product.name), \($0.count) шт., цена: \($0.product.price)")}
    }
    func giveProducts(){
        bucket.removeAll()
    }
    
    func goToCashier(in shop: Shop, paymentMethod: PaymentMethod){
        shop.sellProduct(buyer: self, paymentMethod: paymentMethod)
        
    }
}
