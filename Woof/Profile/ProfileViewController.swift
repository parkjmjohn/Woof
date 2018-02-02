//
//  ProfileViewController.swift
//  Woof
//
//  Created by John Park on 12/28/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit
import Firebase

//var editingMode: Bool!

class ProfileViewController: UIViewController {

    // MARK: Spacing
    let buttonSize: CGFloat = 40.0
    let buttonPadding: CGFloat = 15.0
    let buttonHeight: CGFloat = 50.0
    let buttonSpacing: CGFloat = 12.5
    let animateButtonJump: CGFloat = -260.0
    let animationAlpha: CGFloat = 0.15
    let defaultAlpha: CGFloat = 1.0
    
    // MARK: UI
    var backgroundImg: UIImageView!
    var profileView: ProfileView!
    var messageButton: UIButton!
    var searchButton: UIButton!
    var settingsButton: UIButton!
    var editButton: UIButton!
    var logoutButton: UIButton!
    var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // UI setup
        setUpBackgroundImg()
        setUpProfileView()
        setUpButtons()
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
    
    // MARK: Buttons setup
    func setUpButtons() {
        messageButton = UIButton(frame: CGRect(x: profileEdgeConstant * 2.0, y: profileEdgeConstant * 2.85, width: buttonSize * 1.2, height: buttonSize * 1.2))
        let messageImg = UIImage(named: "message.png")
        messageButton.setBackgroundImage(messageImg, for: .normal)
        messageButton.addTarget(self, action: #selector(messagePressed), for: .touchUpInside)
        view.addSubview(messageButton)
        
        searchButton = UIButton(frame: CGRect(x: view.frame.width - profileEdgeConstant * 2.0 - buttonSize * 1.0, y: profileEdgeConstant * 2.95, width: buttonSize * 1.0, height: buttonSize * 1.0))
        let searchImg = UIImage(named: "search.png")
        searchButton.setBackgroundImage(searchImg, for: .normal)
        searchButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        view.addSubview(searchButton)
        
        settingsButton = UIButton(frame: CGRect(x: view.frame.width - profileEdgeConstant * 1.75, y: profileEdgeConstant * 0.9, width: buttonSize, height: buttonSize))
        let settingsImg = UIImage(named: "settings.png")
        settingsButton.setBackgroundImage(settingsImg, for: .normal)
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
    
    // MARK: Button actions
    @objc func settingsPressed() {
        // Animations
        if settingsButton.transform == .identity {
            UIView.animate(withDuration: TimeInterval(buttonsAnimationSpeed), animations: {
                self.settingsButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
                self.editButton.transform = CGAffineTransform(translationX: 0.0, y: self.animateButtonJump)
                self.logoutButton.transform = CGAffineTransform(translationX: 0.0, y: self.animateButtonJump)
                self.cancelButton.transform = CGAffineTransform(translationX: 0.0, y: self.animateButtonJump)
                self.messageButton.isUserInteractionEnabled = false
                self.searchButton.isUserInteractionEnabled = false
                self.messageButton.alpha = self.animationAlpha
                self.searchButton.alpha = self.animationAlpha
                self.profileView.alpha = self.animationAlpha
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
            self.searchButton.isUserInteractionEnabled = true
            self.messageButton.isUserInteractionEnabled = true
            self.messageButton.alpha = self.defaultAlpha
            self.searchButton.alpha = self.defaultAlpha
            self.profileView.alpha = self.defaultAlpha
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
    
    func logoutWoofUser() {
        WoofUser = DogUser(breedType: "", height: "", weight: "", interestedIn: "", hobbies: "", occupation: "", bio: "")
    }
    
    @objc func messagePressed() {
        let messageViewController = InboxViewController()
        navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    @objc func searchPressed() {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    // MARK: Needed Swift Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
