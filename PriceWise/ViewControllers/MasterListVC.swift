//
//  MasterListVC.swift
//  PriceWise
//
//  Created by Paul John Calma on 12/1/23.
//

import UIKit
import FirebaseFirestore

class MasterListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    @IBOutlet weak var tableView: UITableView!
//    // Define your data source for the table view
//    let dataArray = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//    // Register the cell identifier
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "YourCellIdentifier")
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return dataArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath)
//        cell.textLabel?.text = dataArray[indexPath.row]
//        return cell
//    }
//    
//    //
//    //  MasterListVC.swift
//    //  PriceWise
//    //
//    //  Created by Paul John Calma on 12/1/23.
//    //
//  
//   
//    class MasterListVC: UIViewController, UITableViewDataSource {
        // Your data model structure
          struct Item {
              let id: Int
              let itemName: String
              let price: Int
              let quantity: Int
              let unit: String
              // Add other properties as needed
          }
        var items: [Item] = [] // Array to store fetched Firestore data
    
        @IBOutlet weak var tableView: UITableView! // Connect this to your table view in storyboard or create programmatically
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Access Firestore
            let db = Firestore.firestore()
            // Reference to the "users" collection
            let itemsCollection = db.collection("items")
            // Fetch documents from Firestore
            itemsCollection.getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    // Clear existing data
                    self.items.removeAll()
                    // Parse fetched data and populate 'items' array
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        if let id = data["id"] as? Int,
                           let itemName = data["itemName"] as? String,
                           let price = data["price"] as? Int,
                           let quantity = data["quantity"] as? Int,
                           let unit = data["unit"] as? String{
                           let item = Item(id: id, itemName: itemName, price: price, quantity: quantity, unit: unit)
                            self.items.append(item)
                        }
                    }
                    // Reload table view to display fetched data
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            
            }
            tableView.dataSource = self // Set table view data source
            tableView.reloadData() // Reload table view initially
        
            
            // Do any additional setup after loading the view.
        }
        // MARK: - UITableViewDataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count // Number of rows in the table view
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath)
            let item = items[indexPath.row]
            // Configure the cell with item data
            cell.textLabel?.text = String(item.itemName)
            cell.detailTextLabel?.text = "Item Name: \(item.itemName), Price: \(item.price), Quantity: \(item.quantity), Unit: \(item.unit)"
            // Customize cell as needed
            return cell
        }
        /*
        // MARK: - Navigation
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
