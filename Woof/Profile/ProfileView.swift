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
    let padding0: CGFloat = 15.0
    
    // MARK: UI
    var nameLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        // background color
        backgroundColor = .white
        
        // UI setup
        setUpNameLabel()
    }
    
    func setUpNameLabel() {
        nameLabel = UILabel(frame: CGRect(x: 0.0, y: padding0, width: frame.width, height: 20))
        nameLabel.textAlignment = .center
        nameLabel.text = WoofUserName
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
