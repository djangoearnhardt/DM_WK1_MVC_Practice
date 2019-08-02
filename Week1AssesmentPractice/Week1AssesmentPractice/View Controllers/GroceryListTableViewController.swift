//
//  GroceryListTableViewController.swift
//  Week1AssesmentPractice
//
//  Created by Sam LoBue on 8/1/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import UIKit

class GroceryListTableViewController: UITableViewController {

    // MARK: - Properties
    var groceryList: GroceryList?
    
    // MARK: - Outlets
    @IBOutlet weak var groceryListTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GroceryListController.sharedInstance.loadFromPersistentStorage()
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func groceryListAddTapped(_ sender: Any) {
        guard let name = groceryListTextField.text else { return }
        if name.isEmpty { return }
        GroceryListController.sharedInstance.createGroceryList(name: name)
        groceryListTextField.text = ""
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroceryListController.sharedInstance.groceryListNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryListCell", for: indexPath)
        
        let index = GroceryListController.sharedInstance.groceryListNames[indexPath.row]
        cell.textLabel?.text = index.name
        // Configure the cell...

        return cell
    }
 


   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // IIDOO
        // Identifier
        if segue.identifier == "toGroceryItemsDetail" {
            
            // Index
            if let indexPath = tableView.indexPathForSelectedRow {
                
                // Destination
                guard let destinationVC = segue.destination as? GroceryItemTableViewController else { return }
                
                // Object sending
                let groceryListToSend = GroceryListController.sharedInstance.groceryListNames[indexPath.row]
                
                // Object recieving
                destinationVC.reciever = groceryListToSend
            }
            
        }
        
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
    
    
}
