//
//  NetworkApi.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 15.03.2023.
//

import Foundation
import Alamofire

protocol NetworkService {
    func getLatestItems(completion: @escaping (LatestItem) -> ())
    func getSaleItems(completion: @escaping (SaleItem) -> ())
}

class NetworkApi: NetworkService {
    
    static let sharedInstance = NetworkApi()
    
    func getLatestItems(completion: @escaping (LatestItem) -> ()) {
        let url = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        let request = AF.request(url, method: .get)
        request.responseDecodable { (response : DataResponse<LatestItem,AFError>) in
            switch response.result {
            case.failure(let error):
                print("Error \(error.localizedDescription)")
                fatalError("Error decoding received data")
            case .success(let data):
                completion(data)
            }
        }
    }
    
    func getSaleItems(completion: @escaping (SaleItem) -> ()) {
        let url = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        let request = AF.request(url, method: .get)
        request.responseDecodable { (response : DataResponse<SaleItem,AFError>) in
            switch response.result {
            case.failure(let error):
                print("Error \(error.localizedDescription)")
                fatalError("Error decoding received data")
            case .success(let data):
                completion(data)
            }
        }
    }
}
