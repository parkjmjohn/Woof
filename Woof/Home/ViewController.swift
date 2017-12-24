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
    let padding3: CGFloat = 6.0
    let fontSize0: CGFloat = 65.0
    
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
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.alpha = backgroundAlpha
        view.addSubview(backgroundImage)
        
        header0 = UILabel(frame: CGRect(x: 0.0, y: padding0, width: view.frame.width, height: fontSize0 * 1.2))
        header0.text = "Woof"
        header0.textAlignment = .center
        header0.font = UIFont(name: "SavoyeLetPlain", size: fontSize0)
        header0.textColor = .homeFontColor
        view.addSubview(header0)
        
        header1 = UILabel(frame: CGRect(x: 0.0, y: padding0 + fontSize0, width: view.frame.width, height: fontSize0 * 1.2))
        header1.text = "Like Tinder, But For Dogs"
        header1.textAlignment = .center
        header1.font = UIFont(name: "SavoyeLetPlain", size: fontSize0 / 1.5)
        header1.textColor = .homeFontColor
        view.addSubview(header1)
    }
    
    // MARK: Login and SignUp functions setup
    func setUpLoginSignUp() {
        loginButton = UIButton(frame: CGRect(x: view.center.x - padding2 - padding3, y: view.center.y + padding1, width: padding2, height: buttonHeight))
        loginButton.layer.cornerRadius = buttonCornerRadius
        loginButton.backgroundColor = .signUpColor
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "SavoyeLetPlain", size: buttonFontSize)
        loginButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        //        loginButton.titleLabel?.textColor = .homeFontColor
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        view.addSubview(loginButton)
        
        signUpButton = UIButton(frame: CGRect(x: view.center.x + padding3, y: view.center.y + padding1, width: padding2, height: buttonHeight))
        signUpButton.layer.cornerRadius = buttonCornerRadius
        signUpButton.backgroundColor = .signUpColor
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "SavoyeLetPlain", size: buttonFontSize)
        signUpButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        //        signUpButton.titleLabel?.textColor = .homeFontColor
        signUpButton.addTarget(self, action: #selector(setUpPressed), for: .touchUpInside)
        view.addSubview(signUpButton)
    }
    
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
