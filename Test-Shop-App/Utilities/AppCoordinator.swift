//
//  AppCoordinator.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 22.03.2023.
//

import UIKit

protocol Coordinator {
    var navigationController : UINavigationController { get set }
    
    func start()
}

class AppCoordinator : Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        // The first time this coordinator started, is to launch login page.
        goToSignInPage()
    }
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    func goToLoginPage(){
        // Instantiate LoginViewController
        let loginViewController = LoginViewController()
        // Instantiate Database
        let dataBase = DataManager.shared
        // Instantiate LoginViewModel
        let loginViewModel = LoginViewModel(dataBase: dataBase, coordinator: self)
        // Set the ViewModel to ViewController
        loginViewController.viewModel = loginViewModel
        // Push it.
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func goToSignInPage(){
        let signInViewController = SignInViewController()
        let dataBase = DataManager.shared
        let signInViewModel = SignInViewModel(view: signInViewController, dataBase: dataBase, coordinator: self)
        signInViewModel.coordinator = self
        signInViewController.viewModel = signInViewModel
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func goToTabBarPage() {
        let tb = TabBarController(coordinator: self)
        navigationController.pushViewController(tb, animated: true)
    }
    
    func popToRootVC(){
        navigationController.popToRootViewController(animated: true)
    }
}
