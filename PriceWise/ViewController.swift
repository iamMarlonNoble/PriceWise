//
//  ViewController.swift
//  PriceWise
//
//  Created by Marlon Noble on 11/30/23.
//

import UIKit
// Import Firestore
import FirebaseFirestore

class ViewController: UIViewController {

    var quantity1 = "1000"
    var price1 = "850"
        
    var quantity2 = "100"
    var price2 = "100"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed
        
        // Firestore
        // Add a new document with a generated ID
        
        // Access Firestore
        let db = Firestore.firestore()
        // Reference to the "items" collection
        let itemsCollection = db.collection("items")
        
        // Data to be added
        let itemData: [String: Any] = [
            "id": 5,
            "itemName": "Yakult",
            "price": 12,
            "quantity": 60,
            "unit": "ml"
        // Add more fields as needed
        ]
        
        // Add a new document to the "users" collection
        itemsCollection.addDocument(data: itemData) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully!")
            }
        }
    }


}

