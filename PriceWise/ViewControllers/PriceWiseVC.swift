//
//  PriceWiseVC.swift
//  PriceWise
//
//  Created by Marlon Noble on 11/30/23.
//

import UIKit

class PriceWiseVC: UIViewController {
    
    var quantity1 = "800"
    var price1 = "100"
    var unit1 = "g"
    
    var quantity2 = "100"
    var price2 = "100"
    var unit2 = "g"
    var unitPrices: [Double] = []
    var quotients: [Double] = []
    var prices: [Double] = []
    var quantities: [Double] = []

    var viewModel: ProductComparisonViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let product1 = Product(quantity: 0.0, price: 0.0, unitOfMeasurement: "")
        let product2 = Product(quantity: 0.0, price: 0.0, unitOfMeasurement: "")
        viewModel = ProductComparisonViewModel(product1: product1, product2: product2)
    }
    
    func didTapButton() {
        print("Test Only")
        viewModel.product1.price = Double(price1) ?? 0.0
        viewModel.product1.quantity = Double(quantity1) ?? 0.0
        viewModel.product1.unitOfMeasurement = unit1
        viewModel.product2.price = Double(price2) ?? 0.0
        viewModel.product2.quantity = Double(quantity2) ?? 0.0
        viewModel.product1.unitOfMeasurement = unit2
        
        let testText = viewModel.calculateBetterDeal()
        print(testText)
//        convertStringtoDouble()
    }

    @IBAction func testBtn(_ sender: Any) {
        didTapButton()
    }
}
