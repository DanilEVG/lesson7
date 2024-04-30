//
//  ViewController.swift
//  lesson7
//
//  Created by Даниил Евгеньевич on 19.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        work()
      
    }
    
    func work() {
       
        
        
        let shop = Shop()
        //открытие магазина
        shop.open()
        
        //поступление товара
        if shop.isOpen {
            shop.addProduct(product: Product(name: "milk", price: 4.99), count: 50)
            shop.addProduct(product: Product(name: "chocolate", price: 14.99), count: 50)
            shop.addProduct(product: Product(name: "bread", price: 1.99), count: 50)
            shop.addProduct(product: Product(name: "chees", price: 24.99), count: 50)
            shop.printInfoProducts()
            shop.printBuyersInShop()
            
            let buyer1 = Buyer(name: "Покупатель 1")
            buyer1.takeProduct(named: "milk", count: 10, from: shop)
            buyer1.takeProduct(named: "bread", count: 10, from: shop)
            buyer1.takeProduct(named: "chees", count: 10, from: shop)
            buyer1.takeProduct(named: "chocolate", count: 10, from: shop)
            buyer1.printBucket()
            
            let buyer2 = Buyer(name: "Покупатель 2")
            buyer2.takeProduct(named: "milk", count: 10, from: shop)
            buyer2.takeProduct(named: "bread", count: 10, from: shop)
            buyer2.takeProduct(named: "chees", count: 10, from: shop)
            buyer2.takeProduct(named: "chocolate", count: 10, from: shop)
            buyer2.printBucket()
            
            let buyer3 = Buyer(name: "Покупатель 3")
            buyer3.takeProduct(named: "milk", count: 10, from: shop)
            buyer3.takeProduct(named: "bread", count: 10, from: shop)
            buyer3.takeProduct(named: "chees", count: 10, from: shop)
            buyer3.takeProduct(named: "chocolate", count: 10, from: shop)
            buyer3.printBucket()
            
            let buyer4 = Buyer(name: "Покупатель 4")
            buyer4.takeProduct(named: "milk", count: 10, from: shop)
            buyer4.takeProduct(named: "bread", count: 10, from: shop)
            buyer4.takeProduct(named: "chees", count: 10, from: shop)
            buyer4.takeProduct(named: "chocolate", count: 10, from: shop)
            buyer4.printBucket()
            
            let buyer5 = Buyer(name: "Покупатель 5")
            buyer5.takeProduct(named: "milk", count: 10, from: shop)
            buyer5.takeProduct(named: "bread", count: 10, from: shop)
            buyer5.takeProduct(named: "chees", count: 5, from: shop)
            buyer5.takeProduct(named: "chocolate", count: 10, from: shop)
            buyer5.printBucket()
            
            let buyer6 = Buyer(name: "Покупатель 6")
            buyer6.takeProduct(named: "milk", count: 10, from: shop)
            buyer6.takeProduct(named: "bread", count: 10, from: shop)
            buyer6.takeProduct(named: "chees", count: 5, from: shop)
            buyer6.takeProduct(named: "chocolate", count: 10, from: shop)
            buyer6.printBucket()
            shop.printBuyersInShop()
            
            
            
            shop.printInfoProducts()
            shop.printInfoBucket()
            
            //shop.sellProduct(buyer: buyer1, paymentMethod: .card)
            //shop.sellProduct(buyer: buyer2, paymentMethod: .cash)
            //shop.sellProduct(buyer: buyer3, paymentMethod: .card)
            buyer1.goToCashier(in: shop, paymentMethod: .card)
            buyer2.goToCashier(in: shop, paymentMethod: .card)
            buyer3.goToCashier(in: shop, paymentMethod: .card)
            
            shop.printInfoProducts()
            shop.printInfoBucket()
            
            
            buyer1.printBucket()
            buyer2.printBucket()
            buyer3.printBucket()
            buyer4.printBucket()
            buyer5.printBucket()
            buyer6.printBucket()
            
            shop.close()
        }
    }


}

