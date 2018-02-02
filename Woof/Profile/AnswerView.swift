//
//  AnswerView.swift
//  Woof
//
//  Created by John Park on 12/30/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

class AnswerView: UIStackView {

    // MARK: UI
    let breedAnswer = UITextField()
    let heightAnswer = UITextField()
    let weightAnswer = UITextField()
    let interestAnswer = UITextField()
    let hobbiesAnswer = UITextField()
    let occupationAnswer = UITextField()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.setUpLabels()
        self.setUpAnswers()
    }
    
    // MARK: Labels Setup
    func setUpLabels() {
        breedAnswer.font = .profileAFont
        heightAnswer.font = .profileAFont
        weightAnswer.font = .profileAFont
        interestAnswer.font = .profileAFont
        hobbiesAnswer.font = .profileAFont
        occupationAnswer.font = .profileAFont
//        hobbiesAnswer.backgroundColor = .blue
        addArrangedSubview(breedAnswer)
        addArrangedSubview(heightAnswer)
        addArrangedSubview(weightAnswer)
        addArrangedSubview(interestAnswer)
        addArrangedSubview(hobbiesAnswer)
        addArrangedSubview(occupationAnswer)
    }
    
    func setUpAnswers() {
        breedAnswer.text = WoofUser.breedType
        heightAnswer.text = WoofUser.height
        weightAnswer.text = WoofUser.weight
        interestAnswer.text = WoofUser.interestedIn
        hobbiesAnswer.text = WoofUser.hobbies
        occupationAnswer.text = WoofUser.occupation
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
