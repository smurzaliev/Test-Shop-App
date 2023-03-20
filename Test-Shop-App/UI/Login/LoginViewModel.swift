//
//  LoginViewModel.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 20.03.2023.
//

import Foundation

class LoginViewModel {
    
    func authorizeUser(user: User) -> Bool {
        return DataManager.shared.authorizeUser(user: user)
    }
}
