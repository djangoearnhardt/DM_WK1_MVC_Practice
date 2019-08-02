//
//  Grocery.swift
//  Week1AssesmentPractice
//
//  Created by Sam LoBue on 8/1/19.
//  Copyright © 2019 DjangoEarnhardt. All rights reserved.
//

import Foundation

class Grocery: Codable {
    
    let name: String
    let brand: String?
    
    init(name: String, brand: String) {
        self.name = name
        self.brand = brand
    }
}

extension Grocery: Equatable {
    static func == (lhs: Grocery, rhs: Grocery) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    
}
