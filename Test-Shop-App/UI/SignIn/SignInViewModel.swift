//
//  SignInViewModel.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 14.03.2023.
//

import Foundation
import Realm

class SignInViewModel {
    var view: SignInViewController!
    private let dataBase: DataService
    private let coordinator: Coordinator
        
    required init(view: SignInViewController!, dataBase: DataService, coordinator: Coordinator) {
        self.view = view
        self.dataBase = dataBase
        self.coordinator = coordinator
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
        
    }
    
    func registerNewUser(_ user: User) {
        
        if !user.name.isEmpty {
            if isValidEmail(user.email) {
                if user.password.count >= 6 {
                    if dataBase.checkUser(user: user) {
                        view.presentAlert(title: "Error", message: "This user already exists")
                    } else {
                        dataBase.registerUser(user: user)
                        view.success()
                    }
                } else {
                    view.presentAlert(title: "Error", message: "Password must be more than 6 characters long")
                }
            } else {
                view.presentAlert(title: "Error", message: "Enter valid email")
            }
        } else {
            view.presentAlert(title: "Error", message: "Enter valid name")
        }
    }
    
    func goToLoginPage() {
        coordinator.goToLoginPage()
    }
    
    func goToTabBarPage() {
        coordinator.goToTabBarPage()
    }
}
