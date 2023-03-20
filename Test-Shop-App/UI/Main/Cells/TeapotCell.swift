//
//  TeapotCell.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 20.03.2023.
//

import UIKit

class TeapotCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var largeImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var sellerIcon: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
//        view.layer.borderColor = UIColor(hex: "#B9B9B9")?.cgColor
//        view.layer.borderWidth = 1
        view.image = UIImage(named: "flashSale_seller")
        return view
    }()
    
    private lazy var categoryBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.85
        view.layer.cornerRadius = 4
        return view
    }()
    
    private lazy var discountLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 8)
        view.textColor = .white
        view.text = "Text here"
        view.textAlignment = .center
        return view
    }()
    
    private lazy var discountView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.alpha = 0.85
        view.layer.cornerRadius = 4
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 8)
        view.textColor = .black
        view.text = "Text here"
        view.textAlignment = .center
        return view
    }()
    
    private lazy var itemTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        view.textColor = .white
        view.text = "Text here"
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 9)
        view.textColor = .white
        view.text = "Text here"
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var addItemIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "item_add")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var favIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "flashSale_fav")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func layoutSubviews() {
        setupView()
    }
    
    private func setupView() {
       
        backView.addSubview(largeImage)
        largeImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backView.addSubview(sellerIcon)
        sellerIcon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.top.left.equalToSuperview().offset(7)
        }
        
        backView.addSubview(addItemIcon)
        addItemIcon.snp.makeConstraints { make in
            make.height.width.equalTo(35)
            make.right.bottom.equalToSuperview().offset(-5)
        }
        
        backView.addSubview(favIcon)
        favIcon.snp.makeConstraints { make in
            make.height.width.equalTo(28)
            make.right.equalTo(addItemIcon.snp.left).offset(-5)
            make.centerY.equalTo(addItemIcon.snp.centerY)
        }
        
        backView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-7)
            make.left.equalToSuperview().offset(7)
            make.right.equalTo(favIcon.snp.left).offset(-5)
        }
        
        categoryBackView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(categoryBackView)
        categoryBackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(7)
            make.top.equalToSuperview().offset(95)
        }
        
        discountView.addSubview(discountLabel)
        discountLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        addSubview(discountView)
        discountView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-7)
            make.top.equalToSuperview().offset(7)
        }
        
        backView.addSubview(itemTitleLabel)
        itemTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryBackView.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(7)
            make.right.equalTo(favIcon.snp.right).offset(-5)
            make.bottom.equalTo(priceLabel.snp.top)
        }
    }
    
    func fill(item: Teapot?) {
        largeImage.image = UIImage(named: item?.imageURL ?? "")
        categoryLabel.text = item?.category
        priceLabel.text = "$\(item?.price.formattedWithComma)"
        itemTitleLabel.text = item?.name
        discountLabel.text = "\(item?.discount)% off"
    }
}
