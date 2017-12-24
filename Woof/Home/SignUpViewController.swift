//
//  SignUpViewController.swift
//  Woof
//
//  Created by John Park on 12/24/17.
//  Copyright © 2017 John Park. All rights reserved.
//


import UIKit

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
        view.addSubview(name)
        
        email = UITextField(frame: CGRect(x: 0.0, y: padding1 + buttonHeight * 1.15, width: padding2, height: buttonHeight * 1.15))
        email.center.x = view.center.x
        email.backgroundColor = .textFieldColor
        email.layer.cornerRadius = textFieldCornerRadius
        email.placeholder = " E-mail"
        view.addSubview(email)
        
        password = UITextField(frame: CGRect(x: 0.0, y: 1.1 * padding1 + buttonHeight * 1.15 * 2, width: padding2, height: buttonHeight * 1.15))
        password.center.x = view.center.x
        password.backgroundColor = .textFieldColor
        password.layer.cornerRadius = textFieldCornerRadius
        password.placeholder = " Password"
        view.addSubview(password)
        
        signUpButton = UIButton(frame: CGRect(x: 0.0, y: 1.1 * padding1 + buttonHeight * 1.15 * 3 + padding3, width: padding2, height: buttonHeight * 1.15))
        signUpButton.center.x = view.center.x
        signUpButton.backgroundColor = .homeFontColor
        signUpButton.layer.cornerRadius = textFieldCornerRadius
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = .buttonFont
        signUpButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        view.addSubview(signUpButton)
    }
    
    // MARK: Needed Swift Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
