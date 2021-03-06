//
//  ViewController.swift
//  Woof
//
//  Created by John Park on 12/24/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Padding
    let padding0: CGFloat = 25.0
    let padding1: CGFloat = 150.0
    let padding2: CGFloat = 100.0
    let padding3: CGFloat = 10.0
    let padding4: CGFloat = 15.0
    
    // MARK: UI
    var backgroundImage: UIImageView!
    var header0: UILabel!
    var header1: UILabel!
    var loginButton: UIButton!
    var signUpButton: UIButton!
    
    // MARK: Loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background setup
        setUpBackground()
        setUpLoginSignUp()
    }
    
    // MARK: First View
    override func viewDidAppear(_ animated: Bool) {
        
        // Constants Handler
//        screenWidth = view.frame.width
//        screenHeight = view.frame.height
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.8, animations: {
            self.setUpHeader0()
            self.setUpHeader1()
        }) { (true) in
//            UIView.animate(withDuration: 0.6, animations: {
//                self.setUpLoginSignUp()
//            }, completion: { (true) in
//            })
        }
    }
    
    // MARK: Header0 setup
    func setUpHeader0() {
        header0 = UILabel(frame: CGRect(x: padding4, y: padding0, width: view.frame.width, height: headerFontSize * 1.2))
        header0.text = "WOOF"
        //        header0.textAlignment = .center
        header0.font = .headerFont
        header0.textColor = .homeFontColor
        view.addSubview(header0)
    }
    
    // MARK: Header1 setup
    func setUpHeader1() {
        header1 = UILabel(frame: CGRect(x: 0.0, y: padding0 + headerFontSize, width: view.frame.width - padding4, height: headerFontSize * 1.2))
        header1.text = "It's Like Tinder, But For Dogs"
        header1.textAlignment = .right
        header1.font = .subHeaderFont
        header1.textColor = .homeFontColor
        view.addSubview(header1)
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
    
    // MARK: Background image and label setup
    func setUpBackground() {
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "homeBackground.png")
        backgroundImage.alpha = backgroundAlpha
        view.addSubview(backgroundImage)
    }
    
    // MARK: Login and SignUp functions setup
    func setUpLoginSignUp() {
        loginButton = UIButton(frame: CGRect(x: view.center.x - padding2 - padding3, y: view.center.y + padding1, width: padding2, height: buttonHeight))
//        loginButton.layer.borderWidth = buttonBorder
        loginButton.layer.borderColor = .borderColor
        loginButton.layer.cornerRadius = buttonCornerRadius
        loginButton.backgroundColor = .loginColor
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .buttonFont
        loginButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        view.addSubview(loginButton)
        
        signUpButton = UIButton(frame: CGRect(x: view.center.x + padding3, y: view.center.y + padding1, width: padding2, height: buttonHeight))
//        signUpButton.layer.borderWidth = buttonBorder
        signUpButton.layer.borderColor = .borderColor
        signUpButton.layer.cornerRadius = buttonCornerRadius
        signUpButton.backgroundColor = .signUpColor
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = .buttonFont
        signUpButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        signUpButton.addTarget(self, action: #selector(setUpPressed), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
    // MARK: @objc functions
    @objc func loginPressed() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: false)
    }
    
    @objc func setUpPressed() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: false)
    }
    
    // MARK: Needed Swift Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
