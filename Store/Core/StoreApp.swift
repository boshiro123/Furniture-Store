//
//  StoreApp.swift
//  Store
//
//  Created by shirokiy on 27/10/2023.
//

import SwiftUI

@main
struct StoreApp: App {
    @StateObject var globalDataViewModel = CartViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(globalDataViewModel)

        }
    }
}
