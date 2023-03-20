//
//  ProfileViewModel.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 20.03.2023.
//

import UIKit
import RealmSwift

class ProfileViewModel {
    
    private let dataBase = DataManager.shared
    
    //MARK: - Method for saving new custom profile image for user. It is saved to SandBox with unique name for user
        
    func saveProfileImage(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 0.1) else {
            return false
        }
        var imageName = ""
        let currentUser = dataBase.getCurrentUser()
        if currentUser?.image != nil {
            imageName = currentUser?.image ?? ""
        } else {
            imageName = UUID().uuidString
            dataBase.addImageToUser(image: imageName)
        }
        
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("\(imageName).png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    //MARK: - Method for obtaining relevant custom profile image for current user
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
}
