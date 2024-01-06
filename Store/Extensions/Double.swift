//
//  Double.swift
//  Store
//
//  Created by shirokiy on 31/10/2023.
//

import Foundation

extension Double{
    private var currencyFormatter:NumberFormatter{
        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency.
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    func convert()->String{
        return currencyFormatter.string(for: self) ?? ""
    }
}
