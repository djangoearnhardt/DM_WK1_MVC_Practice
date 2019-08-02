//
//  GroceryListController.swift
//  Week1AssesmentPractice
//
//  Created by Sam LoBue on 8/1/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

//MARK: - Intention
/*
 Write a grocery list MVC with persistence.
 */

import Foundation

class GroceryListController {
    
    // MARK: - Singleton
    static let sharedInstance = GroceryListController()
    
    // MARK: - Properties
    var groceryList: [Grocery] = []
    
    // CRUD
    /// Create a groceryList object
    func createGroceryList(name: String) {
        
    }
    
    /// Create a grocery item, asign to a groceryList
    func createGrocery(item: String, groceryList: [Grocery]) {
        
    }
    
    func updateGroceryList(item: String, groceryList: [Grocery]) {
        
    }
    
    func deleteGroceryList(groceryList: [Grocery]) {
        
    }
    
    // MARK: - Persistence
//    func fileURL() -> URL {
//        return URL
//    }
    
    /// Save JSON to local storage
    func saveToPersistentStorage() {
        
    }
    
    /// Load JSON from local storage
    func deleteFromPersistentStorage() {
        
    }
}

