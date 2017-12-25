//
//  SignUpViewController.swift
//  Woof
//
//  Created by John Park on 12/24/17.
//  Copyright © 2017 John Park. All rights reserved.
//


import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    // MARK: Padding
    let padding0: CGFloat = 25.0
    let padding1: CGFloat = 125.0
    let padding2: CGFloat = 250.0
    let padding3: CGFloat = 28.0
    
    // MARK: UI
    var backgroundImage: UIImageView!
    var backButton: UIButton!
    var name: UITextField!
    var email: UITextField!
    var password: UITextField!
    var repassword: UITextField!
    var signUpButton: UIButton!
    
    // MARK: Loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background setup
        setUpBackgroundImage()
        setUpBackButton()
        setUpSignUp()
    }
    
    // MARK: Removing Navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: Adding Navigation Bar in further ViewControllers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: Background image setup
    func setUpBackgroundImage() {
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.alpha = backgroundAlpha
        view.addSubview(backgroundImage)
    }
    
    // MARK: Back button setup
    func setUpBackButton() {
        backButton = UIButton(frame: CGRect(x: padding0 / 2.0, y: padding0, width: backButtonWidth, height: buttonHeight))
        backButton.layer.borderWidth = buttonBorder
        backButton.layer.borderColor = .borderColor
        backButton.layer.cornerRadius = buttonCornerRadius
        backButton.backgroundColor = .signUpColor
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = .buttonFont
        backButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    
    // MARK: Sign Up setup
    func setUpSignUp() {
        name = UITextField(frame: CGRect(x: 0.0, y: padding1 * 0.9, width: padding2, height: buttonHeight * 1.15))
        name.center.x = view.center.x
        name.backgroundColor = .textFieldColor
        name.layer.cornerRadius = textFieldCornerRadius
        name.placeholder = " Name"
        name.autocorrectionType = .no
        name.autocapitalizationType = .none
        name.spellCheckingType = .no
        view.addSubview(name)
        
        email = UITextField(frame: CGRect(x: 0.0, y: padding1 + buttonHeight * 1.15, width: padding2, height: buttonHeight * 1.15))
        email.center.x = view.center.x
        email.backgroundColor = .textFieldColor
        email.layer.cornerRadius = textFieldCornerRadius
        email.placeholder = " E-mail"
        email.autocorrectionType = .no
        email.autocapitalizationType = .none
        email.spellCheckingType = .no
        view.addSubview(email)
        
        password = UITextField(frame: CGRect(x: 0.0, y: 1.1 * padding1 + buttonHeight * 1.15 * 2, width: padding2, height: buttonHeight * 1.15))
        password.center.x = view.center.x
        password.backgroundColor = .textFieldColor
        password.layer.cornerRadius = textFieldCornerRadius
        password.placeholder = " Password"
        password.autocorrectionType = .no
        password.autocapitalizationType = .none
        password.spellCheckingType = .no
        password.isSecureTextEntry = true
        view.addSubview(password)
        
        repassword = UITextField(frame: CGRect(x: 0.0, y: 1.2 * padding1 + buttonHeight * 1.15 * 3, width: padding2, height: buttonHeight * 1.15))
        repassword.center.x = view.center.x
        repassword.backgroundColor = .textFieldColor
        repassword.layer.cornerRadius = textFieldCornerRadius
        repassword.placeholder = " Re-enter Password"
        repassword.autocorrectionType = .no
        repassword.autocapitalizationType = .none
        repassword.spellCheckingType = .no
        repassword.isSecureTextEntry = true
        view.addSubview(repassword)
        
        signUpButton = UIButton(frame: CGRect(x: 0.0, y: 1.2 * padding1 + buttonHeight * 1.15 * 4 + padding3, width: padding2, height: buttonHeight * 1.15))
        signUpButton.layer.borderWidth = buttonBorder
        signUpButton.layer.borderColor = .borderColor
        signUpButton.center.x = view.center.x
        signUpButton.backgroundColor = .homeFontColor
        signUpButton.layer.cornerRadius = textFieldCornerRadius
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = .buttonFont
        signUpButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    @objc func signUpPressed() {
        let userName = name.text
        let userEmail = email.text
        let userPassword = password.text
        if userName == "" ||
            userEmail == "" ||
            userPassword == "" ||
            repassword.text == "" {
            Error.blankTextFields()
            return
        }
        else if userPassword != repassword.text {
            Error.passwordMismatch()
            return
        }
        else {
            Auth.auth().createUser(withEmail: userEmail!, password: userPassword!, completion: { (user, error) in
                if user != nil {
                    print("FUCk year")
                }
                else {
                    if let userError = error?.localizedDescription {
                        print(userError)
                    }
                    else {
                        Error.userError()
                    }
                }
            })
        }
    }
    
    // MARK: Needed Swift Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
