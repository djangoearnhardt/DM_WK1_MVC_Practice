//
//  GroceryController.swift
//  Week1AssesmentPractice
//
//  Created by Sam LoBue on 8/1/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import Foundation

class GroceryController {
    
    // MARK: - CRUD

    // Create
    ///
    static func createGrocery(item: String, groceryList: GroceryList) {
        let newItem = Grocery(name: item)
        GroceryListController.sharedInstance.addGrocery(grocery: newItem, list: groceryList)
        
    }
}
