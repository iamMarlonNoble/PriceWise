//
//  ViewModels.swift
//  PriceWise
//
//  Created by Marlon Noble on 11/30/23.
//

import Foundation

class ProductComparisonViewModel {
    var product1: Product
    var product2: Product
    var unit: [String] = ["Length", "Weight", "Volume"]
    
    init(product1: Product, product2: Product) {
        self.product1 = product1
        self.product2 = product2
    }
    
    func calculateBetterDeal() {
//        let total1 = product1.price * Double(product1.quantity)
//        let total2 = product2.price * Double(product2.quantity)
//        let quotient1 = (product1.quantity / product1.price).rounded(toPlaces: 20)
        let unitPrice1 = Double(product1.price / product1.quantity).rounded(toPlaces: 20)
        let unitPrice2 = Double(product2.price / product2.quantity).rounded(toPlaces: 20)
        
        print(unitPrice1)
        print(unitPrice2)
        
        if unitPrice1 == unitPrice2 {
            print("Both products are equally priced.")
        } else {
            if unitPrice1 < unitPrice2 {
                print("Product 1 is the better deal.")
            } else {
                print("Product 2 is the better deal.")
            }
        }
    }
}
