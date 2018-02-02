//
//  DogUser.swift
//
//
//  Created by John Park on 12/30/17.
//

import UIKit

class DogUser {
    
    var breedType: String!
    var height: String!
    var weight: String
    var interestedIn: String!
    var hobbies: String!
    var occupation: String!
    var bio: String!
    
    init(breedType: String, height: String, weight: String, interestedIn: String, hobbies: String, occupation: String, bio: String) {
        self.breedType = breedType
        self.height = height
        self.weight = weight
        self.interestedIn = interestedIn
        self.hobbies = hobbies
        self.occupation = occupation
        self.bio = bio
    }
    
//    init(dictionary: [String: Any]) {
//        self.breedType = dictionary["Breed Type"] as? String ?? ""
//        self.height = dictionary["Height"] as? String ?? ""
//        self.weight = dictionary["Weight"] as? String ?? ""
//        self.interestedIn = dictionary["Interested in"] as? String ?? ""
//        self.hobbies = dictionary["Hobbies"] as? String ?? ""
//        self.occupation = dictionary["Occupation"] as? String ?? ""
//        self.bio = dictionary["Bio"] as? String ?? ""
//    }
}

