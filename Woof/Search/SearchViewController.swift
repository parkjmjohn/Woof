//
//  SearchViewController.swift
//  Woof
//
//  Created by John Park on 1/1/18.
//  Copyright © 2018 John Park. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: UI
    var backgroundImg: UIImageView!
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI setup
        setUpBackgroundImg()
        setUpBackButton()
    }
    
    // MARK: Back button setup
    func setUpBackButton() {
        backButton = UIButton(frame: CGRect(x: backButtonPadding / 2.0, y: backButtonPadding, width: backButtonWidth, height: buttonHeight))
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
        navigationController?.popViewController(animated: true)
    }

    // MARK: Background Image Setup
    func setUpBackgroundImg() {
        backgroundImg = UIImageView(frame: UIScreen.main.bounds)
        backgroundImg.image = UIImage(named: "profileBackground.png")
        view.addSubview(backgroundImg)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
