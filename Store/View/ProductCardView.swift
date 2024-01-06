//
//  ProductCardView.swift
//  Store
//
//  Created by shirokiy on 31/10/2023.
//

import SwiftUI

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    let price: String
    let name: String
    @StateObject var cartData = CartViewModel()
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text(name)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$\(price)")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}


#Preview {
    ProductCardView(image: Image("\(CartViewModel().furnitures[0].image)"), size: 210, price: "20,99", name: "Luruxy Swedia №1")
}
