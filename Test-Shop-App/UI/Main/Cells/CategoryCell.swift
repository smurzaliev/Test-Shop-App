//
//  CategoryCell.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 15.03.2023.
//

import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell {
    
    private lazy var iconBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: "#EEEFF4")
        view.layer.cornerRadius = 21
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image?.withTintColor(.black)
        view.tintColor = .black
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 10)
        view.textColor = .init(hex: "#A6A7AB")
        view.text = "Text here"
        view.textAlignment = .center
        return view
    }()
    
    override func layoutSubviews() {
        setupView()
    }
    
    private func setupView() {
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        iconBackView.addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.center.equalToSuperview()
        }
        
        addSubview(iconBackView)
        iconBackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.centerX.equalTo(label.snp.centerX)
            make.bottom.equalTo(label.snp.top).offset(-4)
            make.height.width.equalTo(42)
        }

    }
    
    func fill(title: String, image: UIImage) {
        label.text = title
        iconImage.image = image
    }
}
