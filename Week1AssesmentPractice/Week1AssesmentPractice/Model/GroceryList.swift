//
//  GroceryList.swift
//  Week1AssesmentPractice
//
//  Created by Sam LoBue on 8/1/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import Foundation

class GroceryList {
    let name: String
    let list: [Grocery]
    
    init(name: String, list: [Grocery] = []) {
        self.name = name
        self.list = list
    }
}
