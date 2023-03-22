//
//  LoginViewController.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 13.03.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel!
    
    var passwordPrivacy: Bool = false {
        didSet {
            self.passwordTextField.isSecureTextEntry = passwordPrivacy
        }
    }
    
    //MARK: - View elements
    
    private lazy var logInLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        view.text = "Log in"
        view.textColor = .black
        return view
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .init(hex: "#E8E8E8")
        view.layer.cornerRadius = 15
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .init(hex: "#7B7B7B")
        view.placeholder = "Email"
        view.textAlignment = .center
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
        
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .init(hex: "#E8E8E8")
        view.layer.cornerRadius = 15
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .init(hex: "#7B7B7B")
        view.placeholder = "Password"
        view.textAlignment = .center
        view.isSecureTextEntry = true
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        imageView.image = UIImage(named: "passw_icon")
        let iconContainerView: UIView = UIView(frame:
                       CGRect(x: 0, y: 0, width: 30, height: 15))
        iconContainerView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(passwordPrivacyTrigger))
        iconContainerView.addGestureRecognizer(tap)
        iconContainerView.addSubview(imageView)
        view.rightView = iconContainerView
        view.rightViewMode = .always

        return view
        
    }()
    
    private lazy var logInButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.baseBackgroundColor = .init(hex: "#4E55D7")
        view.configuration = config
        view.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        view.setTitle("Log in", for: .normal)
        view.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupView()
    }
    //MARK: - Setting constraints to view elements
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(logInLabel)
        logInLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(view.frame.height / 7)
        }
        
        view.addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(logInLabel.snp.bottom).offset(view.frame.height / 11)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(firstNameTextField.snp.bottom).offset(35)
        }
        
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.height.equalTo(46)
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(passwordTextField.snp.bottom).offset(65)
        }
    }
    //MARK: - Toggle password hidden mode
    @objc func passwordPrivacyTrigger() {
        self.passwordPrivacy.toggle()
    }
    
    @objc func loginPressed() {
        let user = User()
        user.email = firstNameTextField.text ?? ""
        user.password = passwordTextField.text ?? ""
        if viewModel.authorizeUser(user: user) == true {
            let ac = UIAlertController(title: "Login Success", message: "Successfully Authorized", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
                DispatchQueue.main.async { [weak self] in
                    self?.viewModel.goToMainPage()
                }
            })
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Login Failed", message: "Please check your login and password", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        }
    }

}
