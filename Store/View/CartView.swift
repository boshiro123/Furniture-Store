//
//  CartView.swift
//  Store
//
//  Created by shirokiy on 30/10/2023.
//

import SwiftUI

struct CartView: View {
//    @StateObject var cartData = CartViewModel()
    @EnvironmentObject var global: CartViewModel

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("My cart")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(global.globalData.dataArray){ item in
                        // ItemView
                        ItemView(item: $global.globalData.dataArray[getIndex(item: item)], items: $global.globalData.dataArray)
                    }
                }
            }
            
            // Bottom View
            VStack {
                HStack {
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // Calculating Total Price
                    Text("$\(calculateTotalPrice())")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding([.top, .horizontal])
                
                Button(action: {
                    print("Check out button")
                    print(global.globalData.dataArray)
                    global.globalData.dataArray.removeAll()
                }) {
                    Text("Check out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color(.blue))
                        .cornerRadius(15)
                }
            }
            BottomNavBarView()
        }
        .background(Color("gray").ignoresSafeArea())
    }
    
    
    func getIndex(item: Item) -> Int {
        return global.globalData.dataArray.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func calculateTotalPrice() -> String {
        var price: Double = 0
        global.globalData.dataArray.forEach { (item) in
            price += Double(item.quantity) * item.price
        }
        
        return  price.convert()
    }
}

#Preview {
    CartView()
}
