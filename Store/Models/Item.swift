//
//  item.swift
//  Store
//
//  Created by shirokiy on 30/10/2023.
//

import SwiftUI

struct Item: Identifiable,Equatable {
    var id = UUID().uuidString
    var name : String
    var details: String
    var description: String
    var image: String
    var price: Double
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
}
