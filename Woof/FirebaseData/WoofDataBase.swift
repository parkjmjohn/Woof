//
//  WoofDatabase.swift
//  Woof
//
//  Created by John Park on 12/28/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import Foundation
import Firebase

class WoofDataBase {
    
    static func saveNewUser(name: String, email: String) {
        let ref = Database.database().reference(fromURL: WoofDataBaseSource)
        var userRef = ref.child("users").child(uid!)
        userRef.updateChildValues(["Name": name])
        userRef.updateChildValues(["E-mail": email])
        
        userRef = userRef.child("Profile")
        userRef.updateChildValues(["Bio": "7"])
        userRef.updateChildValues(["Breed Type": "1"])
        userRef.updateChildValues(["Height": "2"])
        userRef.updateChildValues(["Hobbies": "5"])
        userRef.updateChildValues(["Interested in": "4"])
        userRef.updateChildValues(["Occupation": "6"])
        userRef.updateChildValues(["Weight": "3"])
    }
    
}

