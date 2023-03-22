//
//  LoginViewModel.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 20.03.2023.
//

import Foundation

class LoginViewModel {
    private let dataBase: DataService
    weak var coordinator : AppCoordinator!
    
    required init(dataBase: DataService, coordinator: AppCoordinator) {
        self.dataBase = dataBase
        self.coordinator = coordinator
    }
    
    func authorizeUser(user: User) -> Bool {
        return DataManager.shared.authorizeUser(user: user)
    }
    
    func goToMainPage() {
        coordinator.goToTabBarPage()
    }
}
