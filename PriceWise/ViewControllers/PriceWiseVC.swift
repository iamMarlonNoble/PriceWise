//
//  PriceWiseVC.swift
//  PriceWise
//
//  Created by Marlon Noble on 11/30/23.
//

import UIKit

class PriceWiseVC: UIViewController, UIPopoverPresentationControllerDelegate, UnitPickerDelegate {
    
    @IBOutlet weak var quantity1TF: UITextField!
    @IBOutlet weak var price1TF: UITextField!
    @IBOutlet weak var quantity2TF: UITextField!
    @IBOutlet weak var price2TF: UITextField!
    @IBOutlet weak var product1UnitButton: UIButton!
    @IBOutlet weak var product2UnitButton: UIButton!
    
    var viewModel: ProductComparisonViewModel!
    
    var unitPickerView: UnitPickerView?
    var selectedProductIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product(quantity: "", price: "", unitOfMeasurement: "")
        let product2 = Product(quantity: "", price: "", unitOfMeasurement: "")
        
        viewModel = ProductComparisonViewModel(product1: product1, product2: product2)
        unitPickerView = UnitPickerView()
        unitPickerView?.unitDelegate = self
        //        setupUnitPicker()
    }
    
    func didTapButton() {
        viewModel.product1.price = price1TF.text ?? ""
        viewModel.product1.quantity = quantity1TF.text ?? ""
        //        viewModel.product1.unitOfMeasurement = unit1
        viewModel.product2.price = price2TF.text ?? ""
        viewModel.product2.quantity = quantity2TF.text ?? ""
        //        viewModel.product1.unitOfMeasurement = unit2
        
        let fieldChecker = viewModel.itemChecker()
        if fieldChecker == false {
            let willSave = viewModel.calculateAmountWillSave()
            let betterDeal = viewModel.calculateBetterDeal()
            print(betterDeal)
            print(willSave)
        } else {
            //            print("Please check your itemsss!!!")
        }
    }
    
    
    @IBAction func testBtn(_ sender: Any) {
        didTapButton()
    }
    @IBAction func unit1btnTapped(_ sender: UIButton) {
        selectedProductIndex = 0
        presentUnitPicker()
    }
    @IBAction func unit2btnTapped(_ sender: UIButton) {
        selectedProductIndex = 1
        presentUnitPicker()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func didSelectUnit(_ unit: String?) {
        guard let selectedUnit = unit else {
            return // Handle the case where no unit is selected
        }
        
        if selectedProductIndex == 0 {
            product1UnitButton.setTitle(selectedUnit, for: .normal)
            print("Selected unit for product 1: \(selectedUnit)")
            // Perform further actions based on the selected unit for product 1
        } else {
            product2UnitButton.setTitle(selectedUnit, for: .normal)
            print("Selected unit for product 2: \(selectedUnit)")
            // Perform further actions based on the selected unit for product 2
        }
        
        // You can perform any necessary logic based on the selected unit here
        dismiss(animated: true, completion: nil) // Dismiss the popover after selecting the unit
    }

    private func presentUnitPicker() {
        // Show the unit picker when the button is tapped
        guard let unitPickerView = unitPickerView else { return }
        
        let popoverContentController = UIViewController()
        popoverContentController.view = unitPickerView
        
        popoverContentController.modalPresentationStyle = .popover
        popoverContentController.preferredContentSize = CGSize(width: 200, height: 200) // Set preferred content size
        
        let popoverPresentationController = popoverContentController.popoverPresentationController
        popoverPresentationController?.permittedArrowDirections = .any
        if selectedProductIndex == 0 {
            popoverPresentationController?.sourceView = product1UnitButton
            popoverPresentationController?.sourceRect = product1UnitButton.bounds
        } else {
            popoverPresentationController?.sourceView = product2UnitButton
            popoverPresentationController?.sourceRect = product2UnitButton.bounds
        }
        popoverPresentationController?.delegate = self
        
        present(popoverContentController, animated: true, completion: nil)
    }
}
    
//    func showUnitPicker() {
//        guard let picker = unitPicker else { return }
//        
//        let alertController = UIAlertController(title: "Select Unit", message: nil, preferredStyle: .actionSheet)
//        alertController.view.addSubview(picker)
//        
//        let height: NSLayoutConstraint = NSLayoutConstraint(item: alertController.view ?? UIView(), attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 216)
//        alertController.view.addConstraint(height)
//        
//        let selectAction = UIAlertAction(title: "Done", style: .default, handler: nil)
//        alertController.addAction(selectAction)
//        
//        present(alertController, animated: true, completion: nil)
//    }
    
//    func setupUnitPicker() {
//        unitPickerView = UIPickerView()
//        unitPickerView?.delegate = self
//        unitPickerView?.dataSource = self
//        }

//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return units.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return units[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
////        let selectedUnit = units[row]
////        viewModel.updateUnit(for: &activeProduct!, with: selectedUnit)
//        guard let selectedProduct = selectedProduct else {
//            return
//        }
//        if selectedProduct == viewModel.product1 {
//            
//        }

    

