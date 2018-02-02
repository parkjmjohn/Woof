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
    
    class var profileNameFont: UIFont {
        return UIFont(name: "ArialRoundedMTBold", size: profileNameFontSize)!
    }
    
    class var profileQFont: UIFont {
        return UIFont(name: "ArialRoundedMTBold", size: profileNameFontSize * 0.9)!
    }
    
    class var profileAFont: UIFont {
        return UIFont(name: "ArialMT", size: profileNameFontSize * 0.9)!
    }
    
}
