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
    
    // MARK: - SoT
    var groceryListNames: [GroceryList] = []
    var groceryItems: [Grocery] = []
    
    // CRUD
    /// Initializing a new groceryList using a string and adding it to our SoT
    func createGroceryList(name: String) {
            let newList = GroceryList(name: name)
            groceryListNames.append(newList)
            saveToPersistentStorage()
    }
    
    func addGrocery(grocery: Grocery, list: GroceryList) {
        list.list.append(grocery)
        saveToPersistentStorage()
    }
       
//    func updateGroceryList(item: String, groceryList: [GroceryList]) {
//        guard let list = groceryListNames.firstIndex(of: item) else { return }
//        groceryListNames.append(list)
//        
//    }
    
    func deleteGroceryList(groceryList: GroceryList) {
        guard let index = groceryListNames.firstIndex(of: groceryList) else { return }
        groceryListNames.remove(at: index)
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("groceryList.json")
        print(fileURL)
        return fileURL
       
    }
    
    /// Save JSON to local storage
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
            let jsonGroceryList = try encoder.encode(groceryListNames)
            try jsonGroceryList.write(to: fileURL())
        } catch let encodingError {
            print("There was an error saving!! \(encodingError.localizedDescription)")
        }
    }
    /// Load JSON from local storage
    func loadFromPersistentStorage() {
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try Data(contentsOf: fileURL())
            let decodedGroceryList = try decoder.decode([GroceryList].self, from: jsonData)
            groceryListNames = decodedGroceryList
        } catch let decodingError {
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
    }
}

