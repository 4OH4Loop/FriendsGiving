//
//  Guest.swift
//  FriendsGiving
//
//  Created by Carolyn Ballinger on 3/24/25.
//

import Foundation
import SwiftData


@Model
class Guest {
    var name: String
    var item: String
    var notes: String
    
    init(name: String, item: String, notes: String) {
        self.name = name
        self.item = item
        self.notes = notes
    }
    
    convenience init() {
        self.init(name: "", item: "", notes: "")
    }
}

extension Guest {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Guest.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task { @MainActor in
            // Add Mock Data
            container.mainContext.insert(Guest(name: "John", item: "Dessert", notes: "Apple Pie"))
            container.mainContext.insert(Guest(name: "Clara", item: "Coffee", notes: "Dunkin"))
            container.mainContext.insert(Guest(name: "Kyle", item: "Pizza", notes: "Pepperoni"))
            container.mainContext.insert(Guest(name: "Rachel", item: "Salad", notes: "Mixed Greens"))
        }
        return container
    }
}
