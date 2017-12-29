//
//  ProfileView.swift
//  Woof
//
//  Created by John Park on 12/29/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    // MARK: Spacing
    let padding0: CGFloat = 55.0
    let padding1: CGFloat = 30.0
    let imageSize: CGFloat = 100.0
    
    // MARK: UI
    var nameLabel: UILabel!
    var settingsButton: UIButton!
    var userImg: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        // background color
        backgroundColor = .white
        
        // UI setup
        setUpNameLabel()
        setUpSettings()
        setUpUserImg()
    }
    
    // MARK: Name Label Setup
    func setUpNameLabel() {
        nameLabel = UILabel(frame: CGRect(x: 0.0, y: padding0, width: frame.width, height: 20))
        nameLabel.textAlignment = .center
        nameLabel.text = WoofUserName
        addSubview(nameLabel)
    }
    
    // MARK: Settings setup
    func setUpSettings() {
        settingsButton = UIButton(frame: CGRect(x: frame.width - padding1 * 1.70, y: padding1 * 0.45, width: padding1, height: padding1))
        let img = UIImage(named: "settings.png")
        settingsButton.setBackgroundImage(img, for: .normal)
//        settingsButton.backgroundColor = .blue//DEBUG
        addSubview(settingsButton)
    }
    
    // MARK: User Img Setup
    func setUpUserImg() {
        userImg = UIImageView(frame: CGRect(x: self.center.x - imageSize / 1.25, y: 0.0 - imageSize / 2.0, width: imageSize, height: imageSize))
        userImg.layer.borderWidth = profileImgBorder
        userImg.layer.borderColor = .borderColor
        userImg.layer.masksToBounds = false
        userImg.layer.cornerRadius = userImg.frame.height / 2.0
        userImg.clipsToBounds = true
        userImg.image = UIImage(named: "defaultImg.png")//DEBUG
        addSubview(userImg)
    }
    
    // MARK: Needed Swift Functions
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
