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
    
    static func saveNewUser(uid: String, name: String, email: String) {
        let ref = Database.database().reference(fromURL: WoofDataBaseSource)
        let userRef = ref.child("users").child(uid)
        userRef.updateChildValues(["Name": name])
        userRef.updateChildValues(["E-mail": email])
    }
    
}

