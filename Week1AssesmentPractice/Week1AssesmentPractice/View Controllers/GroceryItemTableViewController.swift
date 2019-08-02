//
//  GroceryItemTableViewController.swift
//  Week1AssesmentPractice
//
//  Created by Sam LoBue on 8/1/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import UIKit

class GroceryItemTableViewController: UITableViewController {

    // MARK: - Properties
    var reciever: GroceryList?
    
    // MARK: - Outlets
    @IBOutlet weak var groceryItemTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func addGroceryButtonTapped(_ sender: Any) {
        
        guard let groceryList = reciever, let grocery = groceryItemTextField.text else { return }
        
        if grocery.isEmpty { return }
        
        GroceryController.createGrocery(item: grocery, groceryList: groceryList)
        
        groceryItemTextField.text = ""
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reciever?.list.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        guard let grocery = reciever?.list[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = grocery.name
//        guard let item = reciever?.list[indexPath.row] else { return UITableViewCell }
//        cell.textLabel?.text = item.name

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Groceries"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
*/
    
}
