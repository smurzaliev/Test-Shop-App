//
//  General Extensions.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 15.03.2023.
//

import Foundation

extension Formatter {
    static let withComma: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Numeric {
    var formattedWithComma: String {
        return Formatter.withComma.string(for: self) ?? ""
    }
}
