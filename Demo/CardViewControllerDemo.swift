//
//  CardViewControllerDemo.swift
//  Neon
//
//  Created by David Ulbrich on 6/2/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

import UIKit
import Neon

class CardViewControllerDemo: UIViewController {
    let exampleCardLabel : UILabel = UILabel()
    let cardShadow : UIView = UIView()
    let card : UIView = UIView()
    let cardTitle: UILabel = UILabel()
    let titleLabel : UILabel = UILabel()
    let descriptionLabel : UILabel = UILabel()
    let button : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(exampleCardLabel)
        self.view.addSubview(cardShadow)
        
        let cardRadius: CGFloat = 5.0
        
        exampleCardLabel.text = "Example Card"
        
        cardShadow.layer.cornerRadius = cardRadius
        cardShadow.layer.shadowRadius = 3
        cardShadow.layer.shadowOpacity = 0.9
        cardShadow.layer.shadowColor = UIColor.blackColor().CGColor
        cardShadow.layer.shadowOffset = CGSize(width: 0, height: 3)
        cardShadow.backgroundColor = UIColor(red: 240/255, green: 48/255, blue: 4/255, alpha: 1)
        cardShadow.addSubview(card)
        
        card.layer.cornerRadius = cardRadius
        card.layer.masksToBounds = true
        card.addSubview(cardTitle)
        card.addSubview(titleLabel)
        card.addSubview(descriptionLabel)
        
        cardTitle.backgroundColor = UIColor(red: 61/255, green: 82/255, blue: 113/255, alpha: 1)
        cardTitle.textColor = UIColor.whiteColor()
        cardTitle.text = "LOREM IPSUM"
        cardTitle.textAlignment = .Center
        
        titleLabel.backgroundColor = UIColor(red: 114/255, green: 158/255, blue: 36/255, alpha: 1)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = "Lorem Ipsum"
        
        descriptionLabel.backgroundColor = UIColor(red: 23/255, green: 135/255, blue: 202/255, alpha: 1)
        descriptionLabel.textColor = UIColor.whiteColor()
        descriptionLabel.numberOfLines = 0
        /// NOTE: It doesnt matter which of the following two lines you uncomment, the descriptionLabel will automatically include all the text.
        //descriptionLabel.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        
        button.frame = CGRectMake(100, 100, 100, 50)
        button.setTitle("Test Button", forState: UIControlState.Normal)
        button.backgroundColor = UIColor(red: 224/255, green: 160/255, blue: 60/255, alpha: 1)
        button.addTarget(self, action: #selector(CardViewControllerDemo.buttonPressed), forControlEvents: UIControlEvents.TouchUpInside)
        card.addSubview(button)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let labels : [Frameable] = [titleLabel, descriptionLabel, button]
        
        exampleCardLabel.anchorAndFillEdge(.Top, xPad: 25, yPad: 20, otherSize: 20)
        cardShadow.groupAndAlign(group: .Vertical, andAlign: .UnderCentered, views: [cardShadow], relativeTo: exampleCardLabel, padding: 10, width: UIScreen.mainScreen().bounds.width - 20, height: 10)
        //cardShadow.anchorAndFillEdge(.Top, xPad: 15, yPad: 25, otherSize: 10)
        card.anchorAndFillEdge(.Top, xPad: 0, yPad: 0, otherSize: 10)
        card.groupAndAlign(group: .Vertical, andAlign: .UnderCentered, views: labels, relativeTo: cardTitle, padding: 8, width: card.layer.bounds.width - 16, height: AutoHeight)
        cardTitle.anchorAndFillEdge(.Top, xPad: 0, yPad: 0, otherSize: 30)
        
        let cardHeight = getCardHeight()
        cardShadow.frame.size.height = cardHeight
        card.frame.size.height = cardHeight
    }
    
    func getCardHeight() -> CGFloat {
        var cardHeight : CGFloat = 0.0
        cardHeight += cardTitle.layer.bounds.height + 8*4 + titleLabel.layer.bounds.height + descriptionLabel.layer.bounds.height + button.layer.bounds.height
        return cardHeight
    }
    
    func buttonPressed() {
        print("Button has been pressed")
    }
}