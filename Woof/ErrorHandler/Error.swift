//
//  Error.swift
//  Woof
//
//  Created by John Park on 12/25/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import Foundation

class Error {
    
    static func blankTextFields() {
        print("User did not enter all necessary information")
    }
    
    static func passwordMismatch() {
        print("Password do not match")
    }
    
    static func userError() {
        print("User Error")
    }
    
}
