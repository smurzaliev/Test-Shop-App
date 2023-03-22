//
//  TabBarController.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 13.03.2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    weak var coordinator : AppCoordinator!
    
    init(coordinator: AppCoordinator!) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        let mainVC = MainPageViewController()
        let networkAPI = NetworkApi()
        let dataBase = DataManager.shared
        let mainViewModel = MainPageViewModel(view: mainVC, networkApi: networkAPI, dataBase: dataBase, coordinator: coordinator)
        mainVC.viewModel = mainViewModel
        mainVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tb_home"), selectedImage: UIImage(named: "tb_home"))
        
        let favVC = FavViewController()
        favVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tb_fav"), selectedImage: UIImage(named: "tb_fav"))
        
        let cartVC = CartViewController()
        cartVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tb_cart"), selectedImage: UIImage(named: "tb_cart"))
        
        let messageVC = MessageViewController()
        messageVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tb_message"), selectedImage: UIImage(named: "tb_message"))
        
        let profileVC = ProfileViewController()
        let profileViewModel = ProfileViewModel(dataBase: dataBase, coordinator: coordinator)
        profileVC.viewModel = profileViewModel
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tb_profile"), selectedImage: UIImage(named: "tb_profile"))
        let tabBarList = [mainVC, favVC, cartVC, messageVC, profileVC]
        UITabBar.appearance().tintColor = .init(hex: "#EEEFF4")
        tabBar.barTintColor = .white
        viewControllers = tabBarList
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
}
