//
//  LatestItem.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 15.03.2023.
//

import Foundation

struct LatestItem: Codable {
    let latest: [Latest]
}

struct Latest: Codable {
    let category, name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
