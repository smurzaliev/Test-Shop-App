//
//  ViewController.swift
//  Test-Shop-App
//
//  Created by Samat Murzaliev on 13.03.2023.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    var viewModel: SignInViewModel!
    
    //MARK: - View elements
    var passwordPrivacy: Bool = true {
        didSet {
            self.passwordTextField.isSecureTextEntry = passwordPrivacy
        }
    }
    
    private lazy var signInLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        view.text = "Sign in"
        view.textColor = .black
        return view
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .init(hex: "#E8E8E8")
        view.layer.cornerRadius = 15
        view.font = UIFont(name: "Montserrat-Regular", size: 16)
        view.textColor = .init(hex: "#7B7B7B")
        view.placeholder = "First and last name"
        view.textAlignment = .center
        view.autocorrectionType = .no
        view.autocapitalizationType = .sentences
        return view
        
    }()
    
    private lazy var emailTextField: UITextField = {
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
    
    private lazy var signInButton: UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.baseBackgroundColor = .init(hex: "#4E55D7")
        view.configuration = config
        view.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        view.setTitle("Sign in", for: .normal)
        view.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        return view
    }()
    
    private lazy var alreadyHaveLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.text = "Already have an account"
        view.textColor = .init(hex: "#808080")
        return view
    }()
    
    private lazy var logInLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.text = "Log in"
        view.textColor = .init(hex: "#254FE6")
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var googleSignIn: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "google_icon"), for: .normal)
        view.setTitle("Sign in with Google", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 15)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        return view
    }()
    
    private lazy var appleSignIn: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "apple_icon"), for: .normal)
        view.setTitle("Sign in with Apple", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 15)
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(view.frame.height / 7)
        }
        
        view.addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(signInLabel.snp.bottom).offset(view.frame.height / 11)
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(firstNameTextField.snp.bottom).offset(35)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(emailTextField.snp.bottom).offset(35)
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(46)
            make.left.equalToSuperview().offset(43)
            make.right.equalToSuperview().offset(-43)
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
        }
        
        view.addSubview(alreadyHaveLabel)
        alreadyHaveLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(43)
            make.top.equalTo(signInButton.snp.bottom).offset(18)
        }
        
        view.addSubview(logInLabel)
        logInLabel.snp.makeConstraints { make in
            make.left.equalTo(alreadyHaveLabel.snp.right).offset(5)
            make.top.equalTo(signInButton.snp.bottom).offset(18)
        }
        
        view.addSubview(googleSignIn)
        googleSignIn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logInLabel.snp.bottom).offset(view.frame.height / 11)
        }
        
        view.addSubview(appleSignIn)
        appleSignIn.snp.makeConstraints { make in
            make.left.equalTo(googleSignIn.snp.left)
            make.top.equalTo(googleSignIn.snp.bottom).offset(45)
        }
    }

    @objc func loginTapped() {
        viewModel.goToLoginPage()
    }
    
    @objc func signInPressed() {
        var newUser = User()
        newUser.name = firstNameTextField.text ?? ""
        newUser.email = emailTextField.text ?? ""
        newUser.password = passwordTextField.text ?? ""
        newUser.image = nil
        
        viewModel?.registerNewUser(newUser)
    }
    
    func success() {
        let ac = UIAlertController(title: "Success", message: "New user created!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            DispatchQueue.main.async { [weak self] in
                self?.viewModel.goToTabBarPage()
            }
        })
        present(ac, animated: true)
    }
    
    func presentAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    //MARK: - Toggle password hidden mode
    @objc func passwordPrivacyTrigger() {
        self.passwordPrivacy.toggle()
    }
}

