//
//  ViewController.swift
//  PriceWise
//
//  Created by Marlon Noble on 11/30/23.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // view.backgroundColor = .systemRed
        
        // Firestore
        // Add a new document with a generated ID
        
        // Access Firestore
        let db = Firestore.firestore()
        // Reference to the "items" collection
        let itemsCollection = db.collection("items")
        
        // Data to be added
//        let itemData: [String: Any] = [
//            "id": 8,
//            "itemName": "Toothpaste",
//            "price": 100,
//            "quantity": 50,
//            "unit": "g"
        // Add more fields as needed
//        ]
        
        // Add a new document to the "users" collection
//        itemsCollection.addDocument(data: itemData) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added successfully!")
//            }
//        }
        pushVC()
    }
    
    func pushVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let priceWiseVCStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let priceWiseVC = priceWiseVCStoryboard.instantiateViewController(withIdentifier: "PriceWiseVC") as! PriceWiseVC
            self.navigationController?.pushViewController(priceWiseVC, animated: true)
            print("vc pushed")
        }
    }

}

