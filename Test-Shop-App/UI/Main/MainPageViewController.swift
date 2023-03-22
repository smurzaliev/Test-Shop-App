//
//  MainViewController.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 13.03.2023.
//

import UIKit
import SnapKit

class MainPageViewController: UIViewController {
    
    var viewModel: MainPageViewModel!
    
    //MARK: - Main ScrollView
    
    private lazy var mainScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var contentView: UIView  = {
        let content = UIView()
        return content
    }()
    
    //MARK: - View elements
    
    private lazy var topNavBar = UIView()
    
    private lazy var topNavMenuIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "page1_navMenu")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var topNavTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        view.text = "Trade by bata"
        view.textColor = .black
        return view
    }()
    
    private lazy var profileImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hex: "#4E4D4D")?.cgColor
        view.layer.cornerRadius = 15
        view.image = UIImage(named: "profile_user")
        return view
    }()
    
    private lazy var locationLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.textColor = .init(hex: "#5B5B5B")
        view.text = "Location"
        return view
    }()
    
    private lazy var locationLogo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "page1_navChevronDown")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var searchBar: UITextField = {
        let view = UITextField()
        view.backgroundColor = .init(hex: "#F5F6F7")
        view.layer.cornerRadius = 15
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .init(hex: "#5B5B5B")
        view.placeholder = "What are you looking for?"
        view.textAlignment = .center
        view.isSecureTextEntry = true
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        imageView.image = UIImage(named: "page1_searchIcon")
        let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 0, y: 0, width: 30, height: 15))
        iconContainerView.addSubview(imageView)
        view.rightView = iconContainerView
        view.rightViewMode = .always
        return view
    }()
    
    private lazy var categoryCollection: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.register(CategoryCell.self, forCellWithReuseIdentifier: "category")
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .init(hex: "#FAF9FF")
        view.tag = 1
        return view
    }()
    
    private lazy var latestSectionHeaderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        view.textColor = .black
        view.text = "Latest"
        return view
    }()
    
    private lazy var latestViewAllLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        view.textColor = .init(hex: "#808080")
        view.text = "View all"
        return view
    }()
    
    var latestCollection: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.register(LatestCell.self, forCellWithReuseIdentifier: "latest")
        view.showsHorizontalScrollIndicator = false
        view.tag = 2
        view.backgroundColor = .init(hex: "#FAF9FF")
        return view
    }()
    
    private lazy var flashSaleSectionHeaderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        view.textColor = .black
        view.text = "Flash Sale"
        return view
    }()
    
    private lazy var flashSaleViewAllLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.textColor = .init(hex: "#808080")
        view.text = "View all"
        return view
    }()
    
    var flashSaleCollection: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.register(FlashSaleCell.self, forCellWithReuseIdentifier: "flash")
        view.showsHorizontalScrollIndicator = false
        view.tag = 3
        view.backgroundColor = .init(hex: "#FAF9FF")
        return view
    }()
    
    private lazy var teapotSectionHeaderLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        view.textColor = .black
        view.text = "Tea Collection"
        return view
    }()
    
    private lazy var teapotSaleViewAllLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.textColor = .init(hex: "#808080")
        view.text = "View all"
        return view
    }()
    
    var teapotCollection: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.register(TeapotCell.self, forCellWithReuseIdentifier: "teapot")
        view.showsHorizontalScrollIndicator = false
        view.tag = 4
        view.backgroundColor = .init(hex: "#FAF9FF")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupView()
        viewModel.fetchLatestItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUserImage()
    }
    
    private func setupView() {
        view.backgroundColor = .init(hex: "#FAF9FF")
        
        topNavBar.addSubview(topNavMenuIcon)
        topNavMenuIcon.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(22)
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview()
        }
        
        topNavBar.addSubview(topNavTitleLabel)
        topNavTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(topNavMenuIcon.snp.centerY)
            make.centerX.equalToSuperview()
        }
        
        topNavBar.addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.centerY.equalTo(topNavMenuIcon.snp.centerY)
            make.right.equalToSuperview().offset(-46)
        }
        
        topNavBar.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(10)
            make.centerX.equalTo(profileImage.snp.centerX)
        }
        
        topNavBar.addSubview(locationLogo)
        locationLogo.snp.makeConstraints { make in
            make.width.equalTo(6)
            make.height.equalTo(5)
            make.centerY.equalTo(locationLabel.snp.centerY)
            make.left.equalTo(locationLabel.snp.right).offset(3)
        }
        
        view.addSubview(topNavBar)
        topNavBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.height.equalTo(65)
        }
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(topNavBar.snp.bottom).offset(10)
            make.height.equalTo(36)
            make.left.equalToSuperview().offset(56)
            make.right.equalToSuperview().offset(-56)
        }
               
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().offset(-11)
            make.top.equalTo(searchBar.snp.bottom).offset(2)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        mainScrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
            make.width.equalTo(self.mainScrollView)
        }
        
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        contentView.addSubview(categoryCollection)
        categoryCollection.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(3)
            make.height.equalTo(90)
        }
        
        contentView.addSubview(latestSectionHeaderLabel)
        latestSectionHeaderLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(categoryCollection.snp.bottom).offset(5)
        }
        
        contentView.addSubview(latestViewAllLabel)
        latestViewAllLabel.snp.makeConstraints { make in
            make.centerY.equalTo(latestSectionHeaderLabel.snp.centerY)
            make.right.equalToSuperview()
        }
        
        latestCollection.delegate = self
        latestCollection.dataSource = self
        
        contentView.addSubview(latestCollection)
        latestCollection.snp.makeConstraints { make in
            make.top.equalTo(latestSectionHeaderLabel.snp.bottom).offset(3)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        contentView.addSubview(flashSaleSectionHeaderLabel)
        flashSaleSectionHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(latestCollection.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(2)
        }
        
        contentView.addSubview(flashSaleViewAllLabel)
        flashSaleViewAllLabel.snp.makeConstraints { make in
            make.centerY.equalTo(flashSaleSectionHeaderLabel.snp.centerY)
            make.right.equalToSuperview()
        }
        
        flashSaleCollection.delegate = self
        flashSaleCollection.dataSource = self
        contentView.addSubview(flashSaleCollection)
        flashSaleCollection.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(flashSaleSectionHeaderLabel.snp.bottom).offset(3)
            make.height.equalTo(220)
        }
        
        contentView.addSubview(teapotSectionHeaderLabel)
        teapotSectionHeaderLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(2)
            make.top.equalTo(flashSaleCollection.snp.bottom).offset(15)
        }
        
        contentView.addSubview(teapotSaleViewAllLabel)
        teapotSaleViewAllLabel.snp.makeConstraints { make in
            make.centerY.equalTo(teapotSectionHeaderLabel.snp.centerY)
            make.right.equalToSuperview()
        }
        
        teapotCollection.delegate = self
        teapotCollection.dataSource = self
        contentView.addSubview(teapotCollection)
        teapotCollection.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(teapotSectionHeaderLabel.snp.bottom).offset(3)
            make.height.equalTo(220)
            make.bottom.equalToSuperview()
        }
    }
    
    private func checkUserImage() {
        guard let imageName = DataManager.shared.getCurrentUser()?.image else {return}
        let image = viewModel.getSavedImage(named: imageName)
        profileImage.image = image
    }

}

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return viewModel.categories.count
        case 2:
            return viewModel.latestItems.count
        case 3:
            return viewModel.saleItems.count
        case 4:
            return viewModel.teaCollection.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCell
            cell.fill(title: viewModel.categories[indexPath.item][0] as! String, image: viewModel?.categories[indexPath.item][1] as! UIImage)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latest", for: indexPath) as! LatestCell
            cell.fill(item: viewModel.latestItems[indexPath.item])
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flash", for: indexPath) as! FlashSaleCell
            cell.fill(item: viewModel.saleItems[indexPath.item])
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teapot", for: indexPath) as! TeapotCell
            cell.fill(item: viewModel.teaCollection[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
        case 1:
            return CGSize(width: 65, height: 80)
        case 2:
            return CGSize(width: 115, height: 150)
        case 3:
            return CGSize(width: 175, height: 220)
        case 4:
            return CGSize(width: 175, height: 220)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 2 || collectionView.tag == 3 || collectionView.tag == 4 {
            return 25
        }
        return 10
    }
}
