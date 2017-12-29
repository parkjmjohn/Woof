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
    let padding0: CGFloat = 30.0
    
    // MARK: UI
    var backgroundImg: UIImageView!
    var profileView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI setup
        setUpBackgroundImg()
        setUpProfileView()    }
    
    // MARK: Background Image Setup
    func setUpBackgroundImg() {
        backgroundImg = UIImageView(frame: UIScreen.main.bounds)
        backgroundImg.image = UIImage(named: "profileBackground.png")
        view.addSubview(backgroundImg)
    }
    
    // MARK: Profile View Setup
    func setUpProfileView() {
        profileView = ProfileView(frame: CGRect(x: padding0, y: padding0 * 2.5, width: view.frame.width - padding0 * 2, height: view.frame.height - padding0 * 3.5))
        profileView.layer.cornerRadius = profileViewRadius
        view.addSubview(profileView)
    }
    
    //
//    func handleLogout() {
    
//    do {
//    try FIRAuth.auth()?.signOut()
//    } catch let logoutError {
//        print(logoutError)
//    }
    
    // MARK: Needed Swift Functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
