//
//  ProfileViewController.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 13.03.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var viewModel: ProfileViewModel!
    
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
    
    private lazy var topProfileLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        view.textColor = .black
        view.text = "Profile"
        return view
    }()
    
    private lazy var profileImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hex: "#C0C0C0")?.cgColor
        view.layer.cornerRadius = 30
        view.image = UIImage(named: "profile_user")
        return view
    }()
    
    private lazy var changeProfilePhotoLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 9)
        view.textColor = .init(hex: "#808080")
        view.text = "Change photo"
        let tap = UITapGestureRecognizer(target: self, action: #selector(changePhoto))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var usernameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        view.textColor = .black
        view.text = "Satria Adhi Pradana"
        return view
    }()
    
    private lazy var uploadButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.baseBackgroundColor = .init(hex: "#4E55D7")
        config.imagePadding = 35
        view.configuration = config
        view.setImage(UIImage(named: "profile_upload"), for: .normal)
        view.setTitle("Upload item", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 20)
        return view
    }()
    
    private lazy var profileListIcon1: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "profile_wallet")
        return view
    }()
    
    private lazy var profileListLabel1: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "Trade store"
        return view
    }()
    
    private lazy var profileListAcc1: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "profile_chevron")
        return view
    }()
    
    private lazy var profileListIcon2: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "profile_wallet")
        return view
    }()
    
    private lazy var profileListLabel2: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "Payment method"
        return view
    }()
    
    private lazy var profileListAcc2: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "profile_chevron")
        return view
    }()
    
    private lazy var profileListIcon3: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "profile_wallet")
        return view
    }()
    
    private lazy var profileListLabel3: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "Balance"
        return view
    }()
    
    private lazy var profileListAcc3: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "$ 1593"
        return view
    }()
    
    private lazy var profileListIcon4: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "profile_wallet")
        return view
    }()
    
    private lazy var profileListLabel4: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "Trade history"
        return view
    }()
    
    private lazy var profileListAcc4: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "profile_chevron")
        return view
    }()
    
    private lazy var profileListIcon5: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "profile_refresh")
        return view
    }()
    
    private lazy var profileListLabel5: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "Restore Purchase"
        return view
    }()
    
    private lazy var profileListAcc5: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "profile_chevron")
        return view
    }()
    
    private lazy var profileListIcon6: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "profile_help")
        return view
    }()
    
    private lazy var profileListLabel6: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "Help"
        return view
    }()
    
    private lazy var profileListIcon7: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "profile_exit")
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(logoutPressed))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var profileListLabel7: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .black
        view.text = "Log out"
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(logoutPressed))
        view.addGestureRecognizer(tap)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUserImage()
    }
    //MARK: - Check user custom image
    
    private func checkUserImage() {
        let currentUser = DataManager.shared.getCurrentUser()
        guard let imageName = DataManager.shared.getCurrentUser()?.image else {return}
        let image = viewModel?.getSavedImage(named: imageName)
        profileImage.image = image
    }
    
    //MARK: - Setting constraints to view elements
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        mainScrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
            make.width.equalTo(self.mainScrollView)
        }
        
        contentView.addSubview(topProfileLabel)
        topProfileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.top.equalTo(topProfileLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(changeProfilePhotoLabel)
        changeProfilePhotoLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(changeProfilePhotoLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(uploadButton)
        uploadButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(usernameLabel.snp.bottom).offset(25)
            make.height.equalTo(40)
        }
        
        contentView.addSubview(profileListIcon1)
        profileListIcon1.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(uploadButton.snp.bottom).offset(25)
        }
        
        contentView.addSubview(profileListLabel1)
        profileListLabel1.snp.makeConstraints { make in
            make.left.equalTo(profileListIcon1.snp.right).offset(7)
            make.centerY.equalTo(profileListIcon1.snp.centerY)
        }
        
        contentView.addSubview(profileListAcc1)
        profileListAcc1.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.centerY.equalTo(profileListIcon1.snp.centerY)
            make.right.equalToSuperview().offset(-32)
        }
        
        contentView.addSubview(profileListIcon2)
        profileListIcon2.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(profileListIcon1.snp.bottom).offset(25)
        }
        
        contentView.addSubview(profileListLabel2)
        profileListLabel2.snp.makeConstraints { make in
            make.left.equalTo(profileListIcon2.snp.right).offset(7)
            make.centerY.equalTo(profileListIcon2.snp.centerY)
        }
        
        contentView.addSubview(profileListAcc2)
        profileListAcc2.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.centerY.equalTo(profileListIcon2.snp.centerY)
            make.right.equalToSuperview().offset(-32)
        }
        
        contentView.addSubview(profileListIcon3)
        profileListIcon3.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(profileListIcon2.snp.bottom).offset(25)
        }
        
        contentView.addSubview(profileListLabel3)
        profileListLabel3.snp.makeConstraints { make in
            make.left.equalTo(profileListIcon3.snp.right).offset(7)
            make.centerY.equalTo(profileListIcon3.snp.centerY)
        }
        
        contentView.addSubview(profileListAcc3)
        profileListAcc3.snp.makeConstraints { make in
            make.centerY.equalTo(profileListIcon3.snp.centerY)
            make.right.equalToSuperview().offset(-32)
        }
        
        contentView.addSubview(profileListIcon4)
        profileListIcon4.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(profileListIcon3.snp.bottom).offset(25)
        }
        
        contentView.addSubview(profileListLabel4)
        profileListLabel4.snp.makeConstraints { make in
            make.left.equalTo(profileListIcon4.snp.right).offset(7)
            make.centerY.equalTo(profileListIcon4.snp.centerY)
        }
        
        contentView.addSubview(profileListAcc4)
        profileListAcc4.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.centerY.equalTo(profileListIcon4.snp.centerY)
            make.right.equalToSuperview().offset(-32)
        }
        
        contentView.addSubview(profileListIcon5)
        profileListIcon5.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(profileListIcon4.snp.bottom).offset(25)
        }
        
        contentView.addSubview(profileListLabel5)
        profileListLabel5.snp.makeConstraints { make in
            make.left.equalTo(profileListIcon5.snp.right).offset(7)
            make.centerY.equalTo(profileListIcon5.snp.centerY)
        }
        
        contentView.addSubview(profileListAcc5)
        profileListAcc5.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.centerY.equalTo(profileListIcon5.snp.centerY)
            make.right.equalToSuperview().offset(-32)
        }
        
        contentView.addSubview(profileListIcon6)
        profileListIcon6.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(profileListIcon5.snp.bottom).offset(25)
        }
        
        contentView.addSubview(profileListLabel6)
        profileListLabel6.snp.makeConstraints { make in
            make.left.equalTo(profileListIcon6.snp.right).offset(7)
            make.centerY.equalTo(profileListIcon6.snp.centerY)
        }
        
        contentView.addSubview(profileListIcon7)
        profileListIcon7.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview().offset(32)
            make.top.equalTo(profileListIcon6.snp.bottom).offset(25)
            make.bottom.equalToSuperview()
        }
        
        contentView.addSubview(profileListLabel7)
        profileListLabel7.snp.makeConstraints { make in
            make.left.equalTo(profileListIcon7.snp.right).offset(7)
            make.centerY.equalTo(profileListIcon7.snp.centerY)
        }
        
    }
    
    //MARK: - Method for changing the photo
    
    @objc func changePhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func logoutPressed() {
        viewModel.goToSignInVC()
    }

}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Image picker delegate method
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return }
        //MARK: - Update current user's photo here
        viewModel?.saveProfileImage(image: image)
        checkUserImage()
        dismiss(animated: true)
    }
}
