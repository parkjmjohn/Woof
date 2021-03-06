//
//  Colors.swift
//  Woof
//
//  Created by John Park on 12/24/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var homeFontColor: UIColor {
        return UIColor(red: 1.00, green: 0.43, blue: 0.43, alpha: 1.00)
    }
    
    class var loginColor: UIColor {
        return UIColor(red: 0.44, green: 0.69, blue: 0.96, alpha: 1.00)
    }
    
    class var signUpColor: UIColor {
        return UIColor(red: 0.96, green: 0.50, blue: 0.13, alpha: 1.00)
    }
    
    class var textFieldColor: UIColor {
        return UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
    }
    
}

extension CGColor {
    
    class var borderColor: CGColor {
        return UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
    }
    
}
