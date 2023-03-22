//
//  DataManager.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 14.03.2023.
//

import Foundation
import RealmSwift

protocol DataService {
    func checkUser(user: User) -> Bool
    func authorizeUser(user: User) -> Bool
    func registerUser(user: User)
    func getCurrentUser() -> User?
    func addImageToUser(image: String)
}

class DataManager: DataService {
    
    var currentUser: User? = nil
    
    private let database: Realm? = {
        do {
            let db = try Realm()
            return db

        } catch let err {
            print("Error writing into database \(err.localizedDescription)")
            return nil
        }
        
    }()
    
    static let shared = DataManager()
    
    func checkUser(user: User) -> Bool {
        let users = Array(database!.objects(User.self))
        for user1 in users {
            if user1.email == user.email {
                currentUser = user
                return true
            }
        }
        return false
    }
    
    func authorizeUser(user: User) -> Bool {
        let users = Array(database!.objects(User.self))
        for user1 in users {
            if user1.email == user.email && user1.password == user.password {
                currentUser = user1
                return true
            }
        }
        return false
    }
    
    func registerUser(user: User) {
        try! database!.write {
            database!.add(user, update: .all)
        }
        currentUser = user
    }
    
    func getCurrentUser() -> User? {
        return currentUser
    }
    
    func addImageToUser(image: String) {
        guard let user = currentUser else {return}
        do {
            try database!.write{
                user.image = image
                database!.add(user, update: .all)
                currentUser = user
            }
        } catch let err {
            print("Realm write error \(err.localizedDescription)")
        }
    }
}
