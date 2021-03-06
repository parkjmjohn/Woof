//
//  LoginViewController.swift
//  Woof
//
//  Created by John Park on 12/24/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Padding
    let padding1: CGFloat = 125.0
    let padding2: CGFloat = 250.0
    let padding3: CGFloat = 28.0
    let padding4: CGFloat = 1.15
    
    // MARK: UI
    var backgroundImage: UIImageView!
    var backButton: UIButton!
    var header: UILabel!
    var username: UITextField!
    var password: UITextField!
    var loginButton: UIButton!
    
    // MARK: Loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background setup
        setUpBackgroundImage()
        setUpBackButton()
        setUpHeader()
        setUpLogin()
    }
    
    // MARK: Removing Navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: Adding Navigation Bar in further ViewControllers
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    // MARK: Header setup
    func setUpHeader() {
        header = UILabel(frame: CGRect(x: 0, y: padding1 * 0.5, width: view.frame.width, height: buttonHeight * padding4))
        updateHeader(newText: "Enter E-mail and Password", newColor: .white)
        header.textAlignment = .center
        view.addSubview(header)
    }
    
    func updateHeader(newText: String, newColor: UIColor) {
        header.textColor = newColor
        header.text = newText
        header.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: Background image setup
    func setUpBackgroundImage() {
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "loginBackground.png")
        backgroundImage.alpha = backgroundAlpha
        view.addSubview(backgroundImage)
    }
    
    // MARK: Back button setup
    func setUpBackButton() {
        backButton = UIButton(frame: CGRect(x: backButtonPadding / 2.0, y: backButtonPadding, width: backButtonWidth, height: buttonHeight))
//        backButton.layer.borderWidth = buttonBorder
        backButton.layer.borderColor = .borderColor
        backButton.layer.cornerRadius = buttonCornerRadius
        backButton.backgroundColor = .loginColor
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = .buttonFont
        backButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: Login setup
    func setUpLogin() {
        username = UITextField(frame: CGRect(x: 0.0, y: padding1 * 0.9, width: padding2, height: buttonHeight * padding4))
        username.center.x = view.center.x
        username.backgroundColor = .textFieldColor
        username.layer.cornerRadius = textFieldCornerRadius
        username.layer.sublayerTransform = CATransform3DMakeTranslation(textFieldPadding, 0, 0)
        username.placeholder = "E-mail"
        username.leftViewMode = .always
        username.leftView = .userImg
        username.autocorrectionType = .no
        username.autocapitalizationType = .none
        username.spellCheckingType = .no
        username.delegate = self
        view.addSubview(username)
        
        password = UITextField(frame: CGRect(x: 0.0, y: padding1 + buttonHeight * padding4, width: padding2, height: buttonHeight * padding4))
        password.center.x = view.center.x
        password.backgroundColor = .textFieldColor
        password.layer.cornerRadius = textFieldCornerRadius
        password.layer.sublayerTransform = CATransform3DMakeTranslation(textFieldPadding, 0, 0)
        password.placeholder = "Password"
        password.leftViewMode = .always
        password.leftView = .passwordImg
        password.autocorrectionType = .no
        password.autocapitalizationType = .none
        password.spellCheckingType = .no
        password.isSecureTextEntry = true
        password.delegate = self
        view.addSubview(password)
        
        loginButton = UIButton(frame: CGRect(x: 0.0, y: padding1 + buttonHeight * padding4 * 2 + padding3, width: padding2, height: buttonHeight * padding4))
//        loginButton.layer.borderWidth = buttonBorder
        loginButton.layer.borderColor = .borderColor
        loginButton.center.x = view.center.x
        loginButton.backgroundColor = .homeFontColor
        loginButton.layer.cornerRadius = textFieldCornerRadius
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.titleLabel?.font = .buttonFont
        loginButton.titleEdgeInsets = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    func emptyTextFields() {
        username.text = ""
        password.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == username {
            textField.resignFirstResponder()
            password.becomeFirstResponder()
        } else {
            loginPressed()
        }
        return true
    }
    
    @objc func loginPressed() {
        let userEmail = username.text
        let userPassword = password.text
        if userEmail != "" && userPassword != "" {
            Auth.auth().signIn(withEmail: userEmail!, password: userPassword!, completion: { (user, error) in
                if user != nil {
                    self.getName()
                } else {
                    if let userError = error?.localizedDescription {
                        self.updateHeader(newText: userError, newColor: .red)
                    } else {
                        Error.userError()
                    }
                }
            })
        } else {
            updateHeader(newText: "Fill in All Fields", newColor: .red)
        }
    }

    func getProfile() {
        var ret = [String]()
        var alreadyRan = false
        Database.database().reference(fromURL: WoofDataBaseSource).child("users").child(uid!).child("Profile").observe(.childAdded, with: { (snapshot) in
            ret.append((snapshot.value as? String)!)
            DispatchQueue.main.async {
                WoofUser.bio = ret[0]
                WoofUser.breedType = ret[1]
                WoofUser.height = ret[2]
                WoofUser.hobbies = ret[3]
                WoofUser.interestedIn = ret[4]
                WoofUser.occupation = ret[5]
                WoofUser.weight = ret[6]
//ERROR: Need more efficient wasy
                if alreadyRan == false {
                    self.pushVC()
                    alreadyRan = true
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func getName() {
        Database.database().reference(fromURL: WoofDataBaseSource).child("users").child(uid!).child("Name").observeSingleEvent(of: .value, with: { (snapshot) in
            WoofUserName = snapshot.value as! String
            DispatchQueue.main.async(execute: {
                self.getProfile()
            })
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func pushVC() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
        emptyTextFields()
        updateHeader(newText: "Enter E-mail and Password", newColor: .white)
        username.becomeFirstResponder()
    }
    
    // MARK: Needed Swift Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
