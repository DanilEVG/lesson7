//
//  Shop.swift
//  lesson7
//
//  Created by Даниил Евгеньевич on 19.04.2024.
//
//что такое swiftlind(k)
import Foundation

class Shop {
    private(set) var products: [(product: Product, count: Int)] = []
    var bucket: [(product: Product, count: Int)] = []
    var personnel: [Void] = []
    var buyers: [Buyer] = []
    
    //состояние магазина
    var isOpen = false
    //количество касс
    var countCashier = 5
    var cashiers: [Cashier] = []
    var total = 0.0
    
    func printBuyersInShop() {
        print("В магазине сейчас: \(buyers.count) человек")
        for buyer in buyers {
            print("     \(buyer.name)")
        }
    }
    
    func openCashier() {
        if cashiers.count < countCashier {
            cashiers.append(Cashier(number: cashiers.count))
        }
    }
    
    func closeCashier() {
        for cashier in cashiers {
            total += cashier.subTotal
        }
        cashiers.removeAll()
    }
    
    func freeCashier() -> Int{
        while true {
            for index in 0..<cashiers.count {
                if cashiers[index].isFree() {
                    print("Касса №\(index) свободна")
                    return index
                } else {
                    print("Касса №\(index) занята")
                }
            }
            if cashiers.count < countCashier {
                openCashier()
            }
            
        }
    }
    
    func sellProduct(buyer: Buyer, paymentMethod: PaymentMethod){
        guard let bucketBuyer = cashiers[freeCashier()].processBuyer(buyer: buyer, paymentMethod: paymentMethod) else {
            writeOff(bucketBuyer: buyer.bucket, from: &bucket, nameBuyer: buyer.name, isErrorPay: true, isPrint: true)
            buyer.bucket.removeAll()
            
            return
        }
        //списать товар
        writeOff(bucketBuyer: bucketBuyer, from: &bucket, nameBuyer: buyer.name, isErrorPay: false, isPrint: true)
        writeOff(bucketBuyer: bucketBuyer, from: &products, nameBuyer: buyer.name,isErrorPay: false, isPrint: false)
        buyer.bucket.removeAll()
    }
    
    func writeOff(bucketBuyer: [(product: Product, count: Int)], from bucketShop: inout [(product: Product, count: Int)], nameBuyer: String, isErrorPay: Bool, isPrint: Bool){
        for bBucket in bucketBuyer {
            for index in 0..<bucketShop.count {
                if bucketShop[index].product.name == bBucket.product.name {
                    bucketShop[index].count -= bBucket.count
                    if isPrint {
                        if isErrorPay {
                            print("Изъят товар: \(bBucket.product.name) у покупателя \(nameBuyer)")
                        } else {
                            print("Продан товар: \(bBucket.product.name) покупателю \(nameBuyer)")
                        }
                    }
                    
                    
                    break
                }
            }
        }
    }
    
    func open() {
        isOpen = true
    }
    
    func killBuyer(){
        for buyer in buyers {
            buyer.bucket.removeAll()
        }
    }
    
    func close() {
        //выгнать покупателей
        killBuyer()
        //закрыть кассы
        closeCashier()
        //забрать продукты из корзин покупателей
        bucket.removeAll()
        //вывести выручку за день
        print("Выручка за день: \(total)")
        //закрыть магазин
        isOpen = false
    }
    
    
    
    func addProduct (product: Product, count: Int){
        products.append((product, count))
    }
    
    func getProduct(name: String, count: Int) -> Product? {
        let idxBucket = bucket.firstIndex { p in
            p.product.name == name
        }
        let idxProduct = products.firstIndex { p in
            p.product.name == name
        }
        guard let idxProduct else {
            return nil
        }
        if let idxBucket {
            if bucket[idxBucket].count + count <= products[idxProduct].count {
                bucket[idxBucket].count += count
                //products[idxProduct].count -= count
                return products[idxProduct].product
            } else {
                print("Товар закончился")

                return nil
            }
        } else {
            bucket.append((product: Product(name: products[idxProduct].product.name, price: products[idxProduct].product.price), count: count))
            //products[idxProduct].count -= count
            return products[idxProduct].product
        }
        
        
    }
    
    func printInfoProducts() {
        print(" В магазине на остатке:")
        products.map{print("    Продукт: \($0.product.name), \($0.count) шт., цена: \($0.product.price)")}
    }
    
    func printInfoBucket() {
        print(" У посетителей в корзинах:")
        bucket.map{print("  Продукт: \($0.product.name), \($0.count) шт., цена: \($0.product.price)")}
    }
    /*
     
    
    func retreiveProduct(_ product : Product) {
        //поиск первого индекса со значением product
        let idx = products.firstIndex { p in
            p === product
        }
        
        guard let idx else {
            return
        }
        products.remove(at: idx)
        
    }
     */
    
}
/*
 1. Cashien
    -processBuyer - принять покупателя
    -subTotal - считать выручку
 
 2. открытие и закрытие магазина
    при закрытии собрать выручку и занулить на кассах subTotal
    
 3. создать покупателей
    создать открыть магазин
    
 4. переписать все на структуры
    
    
 */
