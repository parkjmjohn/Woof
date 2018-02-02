//
//  QuestionView.swift
//  Woof
//
//  Created by John Park on 12/30/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit

class QuestionView: UIStackView {
    
    // MARK: UI
    let breedLabel = UILabel()
    let heightLabel = UILabel()
    let weightLabel = UILabel()
    let interestLabel = UILabel()
    let hobbiesLabel = UILabel()
    let occupationLabel = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setUpLabels()
    }
    
    // MARK: Labels setup
    func setUpLabels() {
        breedLabel.text = "Breed Type:"
        heightLabel.text = "Height:"
        weightLabel.text = "Weight:"
        interestLabel.text = "Interested in:"
        hobbiesLabel.text = "Hobbies:"
        occupationLabel.text = "Occupation:"
        breedLabel.font = .profileQFont
        heightLabel.font = .profileQFont
        weightLabel.font = .profileQFont
        interestLabel.font = .profileQFont
        hobbiesLabel.font = .profileQFont
        occupationLabel.font = .profileQFont
        addArrangedSubview(breedLabel)
        addArrangedSubview(heightLabel)
        addArrangedSubview(weightLabel)
        addArrangedSubview(interestLabel)
        addArrangedSubview(hobbiesLabel)
        addArrangedSubview(occupationLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
