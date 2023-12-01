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
    var unitPrices: [Double] = []
    var prices: [Double] = []
    var quantities: [Double] = []
    var filteredUnitPrices: [Double] = []
    let itemNumbers = [1, 2]
    var willSave = 0.0
    var betterDeal = 0
    var missingValue = false
    
    init(product1: Product, product2: Product) {
        self.product1 = product1
        self.product2 = product2
    }
    
    func itemChecker() -> Bool {
        prices.removeAll()
        quantities.removeAll()
        unitPrices.removeAll()
        filteredUnitPrices.removeAll()
        let arrayOfQuantities = [product1.quantity, product2.quantity]
        let arrayOfPrices = [product1.price, product2.price]
        
        for (quantity, price) in zip(arrayOfQuantities, arrayOfPrices) {
            let itemQuantity = Double(quantity ) ?? 0
            let itemPrice = Double(price ) ?? 0
            
            if quantity.isEmpty == false && price.isEmpty == false {
                let unitPrice = Double(itemPrice / itemQuantity).rounded(toPlaces: 20)
                unitPrices.append(unitPrice)
                prices.append(itemPrice)
                quantities.append(itemQuantity)
            } else if quantity.isEmpty && price.isEmpty {
//                unitPrices.append(0.0)
                missingValue = true
            } else if quantity.isEmpty == false && price.isEmpty {
                missingValue = true
            } else if quantity.isEmpty && price.isEmpty == false {
                missingValue = true
            }
        }
        
        if unitPrices.count != 2 {
            print("\nPlease check your itemsss!!\n\n\n\n* * * E.N.D * * *")
            return missingValue
        } else {
            print("\nPerforming calculations....")
            return false
        }
    }
    
    func checkUnits() {
        
    }
    
    func calculateAmountWillSave() -> String {
        let highestQuantity = Double(quantities.max() ?? 0)
        let lowestQuantity = Double(quantities.min() ?? 0)
        let highestPrice = Double(prices.max() ?? 0)
        let lowestPrice = Double(prices.min() ?? 0)
        
        let quotient = highestQuantity / lowestQuantity
        let product = quotient * lowestPrice
        var difference = 0.00
        if product > highestPrice {
            difference = Double(product - highestPrice).rounded(toPlaces: 2)
        } else {
            difference = Double(highestPrice - product).rounded(toPlaces: 2)
        }
        willSave = difference
        return "You will save: \(willSave)\n\n\n\n* * * E.N.D * * *"
    }
    
    func calculateBetterDeal() -> String {
        for unitPrice in unitPrices {
            if unitPrice != 0.0 {
                filteredUnitPrices.append(unitPrice)
            }
        }
        let lowestUnitPrice = filteredUnitPrices.min() ?? 0
        let indexOfLowestUP = unitPrices.firstIndex(of: lowestUnitPrice) ?? 0
        let itemNumber = itemNumbers[indexOfLowestUP]
        if willSave != 0.0 {
            return "Product \(itemNumber) is the better deal."
        } else {
            return "Both products are equally priced."
        }
    }
    
    func updateUnit(for product: inout Product, with unitOfMeasurement: String) {
        product.unitOfMeasurement = unitOfMeasurement
    }
}
