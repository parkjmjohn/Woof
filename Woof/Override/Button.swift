//
//  Button.swift
//  Woof
//
//  Created by John Park on 12/25/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

extension UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? backgroundColor?.withAlphaComponent(0.85) : backgroundColor?.withAlphaComponent(1.0)
        }
    }
    
}

