//
//  User.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 14.03.2023.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted var userID = UUID().uuidString
    @Persisted var name: String
    @Persisted var email: String
    @Persisted var password: String
    @Persisted var image: String?
    
    override class func primaryKey() -> String? {
        return "userID"
    }
}
