//
//  CartViewModel.swift
//  Store
//
//  Created by shirokiy on 30/10/2023.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var items = [
        Item(name: "Peace Skull Shirt", details: "Gray - L",description: "0", image: "p1", price: 20.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Myrtle Beach Sweater", details: "White - M",description: "0", image: "p2", price: 25.99, quantity: 2, offset: 0, isSwiped: false),
        Item(name: "Eywa Hoodie", details: "White - L",description: "0", image: "p3", price: 22.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Russ Shirt", details: "Light Red - L",description: "0", image: "p4", price: 15.20, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Comfort Jacket", details: "Black - M",description: "0", image: "p5", price: 29.99, quantity: 1, offset: 0, isSwiped: false)
    ]
    
    @Published var furnitures = [
        Item(name: "Luruxy Swedia №1", details: "Chair",description: "0", image: "chair_1", price: 20.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Luruxy Swedia №2", details: "Chair",description: "0", image: "chair_2", price: 25.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Luruxy Swedia №3", details: "Chair",description: "0", image: "chair_3", price: 22.99, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Luruxy Swedia №4", details: "Chair",description: "0", image: "chair_4", price: 15.20, quantity: 1, offset: 0, isSwiped: false),

    ]
    
    @Published var globalData: GlobalData = GlobalData()
}
