//
//  Fonts.swift
//  Woof
//
//  Created by John Park on 12/24/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

extension UIFont {
    
    class var headerFont: UIFont {
        return UIFont(name: "GillSans-UltraBold", size: headerFontSize)!
    }
    
    class var subHeaderFont: UIFont {
        return UIFont(name: "SavoyeLetPlain", size: headerFontSize / 2.0)!
    }
    
    class var buttonFont: UIFont {
        return UIFont(name: "SavoyeLetPlain", size: buttonFontSizer)!
    }
    
    class var errorFont: UIFont {
        return UIFont(name: "Menlo-Regular", size: buttonHeight * 1.3)!
    }
    
}
