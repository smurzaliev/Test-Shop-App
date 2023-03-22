//
//  MainPageViewModel.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 15.03.2023.
//

import UIKit

class MainPageViewModel {
    
    weak var view: MainPageViewController!
    private let networkApi: NetworkService!
    private let dataBase: DataService
    weak var coordinator : AppCoordinator!
    var latestItems = [Latest]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view.latestCollection.reloadData()
            }
        }
    }
    
    var saleItems = [FlashSale]() {
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.view.flashSaleCollection.reloadData()
            }
        }
    }
    
    init(view: MainPageViewController, networkApi: NetworkService, dataBase: DataService, coordinator: AppCoordinator) {
        self.view = view
        self.networkApi = networkApi
        self.dataBase = dataBase
        self.coordinator = coordinator
    }
    
    //MARK: - Items for Category Collection
    
    let categories = [
        [ "Phones", UIImage(named: "category_phones") ?? UIImage() ],
        [ "Headphones", UIImage(named: "category_headphones") ?? UIImage()],
        [ "Games", UIImage(named: "category_games") ?? UIImage()],
        [ "Cars", UIImage(named: "category_cars") ?? UIImage()],
        [ "Furniture", UIImage(named: "category_furniture") ?? UIImage()],
        [ "Kids", UIImage(named: "category_kids") ?? UIImage()],
        [ "Sports", UIImage(systemName: "figure.indoor.cycle") ?? UIImage()],
        [ "Home", UIImage(systemName: "house") ?? UIImage()],
        [ "Watch", UIImage(systemName: "applewatch.watchface") ?? UIImage()]
    ]
    
    //MARK: - Custom data for third collection
    
    let teaCollection = [Teapot(category: "Teapot", name: "Classic porcelain teapon", price: 25, discount: 15, imageURL: "teapot1"),
                           Teapot(category: "Teapot", name: "Electric teapot", price: 75, discount: 20, imageURL: "teapot2"),
                           Teapot(category: "Teapot", name: "Doule-decker teapot", price: 35, discount: 10, imageURL: "teapot3"),
                           Teapot(category: "Teapot", name: "Guest glasses", price: 40, discount: 15, imageURL: "teapot4"),
                           Teapot(category: "Teapot", name: "Everyday kitchet teapot", price: 20, discount: 10, imageURL: "teapot5")]
    
    func fetchLatestItems() {
        var latest = latestItems
        var sale = [FlashSale]()
        networkApi.getLatestItems { result in
            latest = result.latest
        }
        networkApi.getSaleItems { result in
            sale = result.flashSale
            if !latest.isEmpty && !sale.isEmpty {
                self.latestItems = latest
                self.saleItems = sale
            }
        }
    }
    
    //MARK: - Method for updating the profile image with latest update
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}
