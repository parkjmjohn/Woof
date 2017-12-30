//
//  ProfileViewController.swift
//  Woof
//
//  Created by John Park on 12/28/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    // MARK: Spacing
    let settingsSize: CGFloat = 30.0
    let buttonPadding: CGFloat = 15.0
    let buttonHeight: CGFloat = 50.0
    let animateButtonJump: CGFloat = -260.0
    let buttonSpacing: CGFloat = 12.5
    
    // MARK: UI
    var backgroundImg: UIImageView!
    var profileView: ProfileView!
    var settingsButton: UIButton!
    var editButton: UIButton!
    var logoutButton: UIButton!
    var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI setup
        setUpBackgroundImg()
        setUpProfileView()
        setUpSettings()
    }
    
    // MARK: Background Image Setup
    func setUpBackgroundImg() {
        backgroundImg = UIImageView(frame: UIScreen.main.bounds)
        backgroundImg.image = UIImage(named: "profileBackground.png")
        view.addSubview(backgroundImg)
    }
    
    // MARK: Profile View Setup
    func setUpProfileView() {
        profileView = ProfileView(frame: CGRect(x: profileEdgeConstant, y: profileEdgeConstant * 2.5, width: view.frame.width - profileEdgeConstant * 2, height: view.frame.height - profileEdgeConstant * 3.5))
        profileView.layer.cornerRadius = profileViewRadius
        view.addSubview(profileView)
    }
    
    // MARK: Settings setup
    func setUpSettings() {
        settingsButton = UIButton(frame: CGRect(x: view.frame.width - profileEdgeConstant * 2.5, y: profileEdgeConstant * 2.85, width: settingsSize, height: settingsSize))
        let img = UIImage(named: "settings.png")
        settingsButton.setBackgroundImage(img, for: .normal)
        //        settingsButton.backgroundColor = .blue//DEBUG
        settingsButton.addTarget(self, action: #selector(settingsPressed), for: .touchUpInside)
        view.addSubview(settingsButton)
        
        editButton = UIButton(frame: CGRect(x: buttonPadding, y: view.frame.height + profileEdgeConstant * 2, width: view.frame.width - buttonPadding * 2, height: buttonHeight))
        editButton.setTitle("Edit Profile", for: .normal)
        editButton.layer.cornerRadius = popUpButtonCornerRadius
        editButton.backgroundColor = .loginColor
        editButton.addTarget(self, action: #selector(editPressed), for: .touchUpInside)
        view.addSubview(editButton)
        
        logoutButton = UIButton(frame: CGRect(x: buttonPadding, y: view.frame.height + profileEdgeConstant * 2 + buttonSpacing + buttonHeight, width: view.frame.width - buttonPadding * 2, height: buttonHeight))
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.layer.cornerRadius = popUpButtonCornerRadius
        logoutButton.backgroundColor = .homeFontColor
        logoutButton.addTarget(self, action: #selector(logoutPressed), for: .touchUpInside)
        view.addSubview(logoutButton)
        
        cancelButton = UIButton(frame: CGRect(x: buttonPadding, y: view.frame.height + profileEdgeConstant * 2 + buttonSpacing * 2.85 + buttonHeight * 2, width: view.frame.width - buttonPadding * 2, height: buttonHeight))
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.layer.cornerRadius = popUpButtonCornerRadius
        cancelButton.backgroundColor = .signUpColor
        cancelButton.addTarget(self, action: #selector(cancelSettings), for: .touchUpInside)
        view.addSubview(cancelButton)
    }
    
    @objc func settingsPressed() {
        // Blur
        //        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        //        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //        blurEffectView.frame = bounds
        //        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Animations
        if settingsButton.transform == .identity {
            UIView.animate(withDuration: TimeInterval(buttonsAnimationSpeed), animations: {
                self.settingsButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
                self.editButton.transform = CGAffineTransform(translationX: 0.0, y: self.animateButtonJump)
                self.logoutButton.transform = CGAffineTransform(translationX: 0.0, y: self.animateButtonJump)
                self.cancelButton.transform = CGAffineTransform(translationX: 0.0, y: self.animateButtonJump)
            }) { (true) in
            }
        } else {
            cancelSettings()
        }
    }
    
    @objc func cancelSettings() {
        UIView.animate(withDuration: TimeInterval(buttonsAnimationSpeed), animations: {
            self.settingsButton.transform = .identity
            self.editButton.transform = .identity
            self.logoutButton.transform = .identity
            self.cancelButton.transform = .identity
        }) { (true) in
        }
    }
    
    @objc func editPressed() {
        cancelSettings()
    }
    
    @objc func logoutPressed() {
        do {
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        } catch let logoutError {
            print(logoutError)
        }
    }
    
    // MARK: Needed Swift Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
