//
//  Images.swift
//  Woof
//
//  Created by John Park on 12/24/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

extension UIView {
    
    class var userImg: UIImageView {
        var img: UIImageView
        img = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 25.0, height: 25.0))
        img.image = UIImage(named: "user.png")
        return img
    }
    
    class var passwordImg: UIImageView {
        var img: UIImageView
        img = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 25.0, height: 25.0))
        img.image = UIImage(named: "password.png")
        return img
    }
    
}
