//
//  BottomNavBarView.swift
//  Store
//
//  Created by shirokiy on 31/10/2023.
//

import SwiftUI

struct BottomNavBarView: View {
    @State private var isShowingCart = false
    @State private var isShowingHome = false

    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("house.fill"), action: {
                isShowingHome=true;
            })
            .fullScreenCover(isPresented: $isShowingHome, content: {
                HomeView()
            })
            BottomNavBarItem(image:Image("cart.fill"), action: {
                isShowingCart=true
            }).fullScreenCover(isPresented: $isShowingCart, content: {
                CartView()
            })
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

#Preview {
    BottomNavBarView()
}
