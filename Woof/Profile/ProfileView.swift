//
//  ProfileView.swift
//  Woof
//
//  Created by John Park on 12/29/17.
//  Copyright © 2017 John Park. All rights reserved.
//

import UIKit
import Firebase

class ProfileView: UIView {

    // MARK: Spacing
    let padding0: CGFloat = 55.0
    let imageSize: CGFloat = 100.0
    let labelHeight: CGFloat = 20.0
    let stackPadding: CGFloat = 15.0
    let bioPadding: CGFloat = 5.0
//    let descriptionSpacing: CGFloat = 15.0
    
    // MARK: UI
    var nameLabel: UILabel!
    var userImg: UIImageView!
    var bioLabel = UILabel()
    var bioAnswer = UITextView()
    var questionView: QuestionView!
    var answerView: AnswerView!
    var user: DogUser!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        // background color
        backgroundColor = .white
        
        // UI setup
        setUpLabels()
        setUpUserImg()
    }
    
    // MARK: Labels Setup
    func setUpLabels() {
        nameLabel = UILabel(frame: CGRect(x: 0.0, y: padding0, width: frame.width, height: labelHeight * 1.2))
        nameLabel.textAlignment = .center
        nameLabel.font = .profileNameFont
        nameLabel.text = WoofUserName
        addSubview(nameLabel)
        
        // Subview paddings
        let firstPadding = stackPadding * 1.5 + padding0 + labelHeight
        let secondPadding = frame.height - padding0 - labelHeight - stackPadding * 15.0
        let thirdPadding = CGFloat(12.5)
        
        questionView = QuestionView(frame: CGRect(x: stackPadding, y: firstPadding, width: frame.width / 2.0, height: secondPadding))
        questionView.axis = .vertical
        questionView.distribution = .equalSpacing
        addSubview(questionView)
        
        answerView = AnswerView(frame: CGRect(x: frame.width / 2.0, y: firstPadding, width: frame.width / 2.0, height: secondPadding))
        answerView.axis = .vertical
        answerView.distribution = .equalSpacing
        answerView.alignment = .trailing
        addSubview(answerView)
        
        bioLabel = UILabel(frame: CGRect(x: stackPadding, y: firstPadding + secondPadding + thirdPadding, width: frame.width - stackPadding * 2.0, height: profileNameFontSize))
        bioLabel.font = .profileQFont
        bioLabel.text = "Bio:"
        addSubview(bioLabel)
        
        bioAnswer = UITextView(frame: CGRect(x: stackPadding, y: firstPadding + secondPadding + thirdPadding * 1.5 + profileNameFontSize, width: frame.width - stackPadding * 2.0, height: frame.height - (firstPadding + secondPadding + thirdPadding * 3.0 + profileNameFontSize)))
        bioAnswer.layer.borderColor = UIColor(named: "Black")?.cgColor
        bioAnswer.layer.cornerRadius = popUpButtonCornerRadius
        bioAnswer.layer.borderWidth = 1.0
        addSubview(bioAnswer)
    }
    
    // MARK: User Img Setup
    func setUpUserImg() {
        userImg = UIImageView(frame: CGRect(x: self.center.x - imageSize / 1.25, y: 0.0 - imageSize / 2.0, width: imageSize, height: imageSize))
        userImg.layer.borderWidth = profileImgBorder
        userImg.layer.borderColor = .borderColor
        userImg.layer.masksToBounds = false
        userImg.layer.cornerRadius = userImg.frame.height / 2.0
        userImg.clipsToBounds = true
        userImg.image = UIImage(named: "defaultImg.png")//DEBUG
        addSubview(userImg)
    }
    
    // MARK: Needed Swift Functions
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
