//
//  UserConstants.swift
//  Woof
//
//  Created by John Park on 12/28/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit
import Firebase

let WoofDataBaseSource = "https://woof-7d129.firebaseio.com/"
let uid = Auth.auth().currentUser?.uid

// User's Info
//var WoofUser = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7"]
var WoofUserName = ""
var WoofUser = DogUser(breedType: "", height: "", weight: "", interestedIn: "", hobbies: "", occupation: "", bio: "")
