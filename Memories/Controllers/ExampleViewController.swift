//
//  ExampleViewController.swift
//  Memories
//
//  Created by Nikola Popovic on 3/22/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    @IBOutlet var views: [UIButton]!
    
    
    var listOfTwoCards = [UIView]()
    
    private var game: ExapleGameModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let countOfViews = views.count
        game = ExapleGameModel(numberOfPairs: (countOfViews + 1) / 2, shuffelCard: 20)
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        game.cardSelect(selectedIndex: (views.index(of: sender))!)
        updateViewFormModel()
    }
    
    func updateViewFormModel() {
        for index in views.indices {
            let button = views[index]
            let cardModel = game.listOfModel[index]
            if cardModel.isFaceUp {
                cardModel.isSelcted == true ? animationFaceUp(button: button, card: cardModel) : faceUpViews(button: button, card: cardModel)
            } else {
                cardModel.isSelcted == true ? animateFaceDown(button: button) : faceDownViews(button: button)
            }
            if cardModel.isMatched {
               animateMathced(button: button)
            }
        }
    }
    
    func animationFaceUp(button : UIButton, card : ExampleCardModel){
        UIView.transition(with: button, duration: 0.6, options: .transitionFlipFromLeft, animations: {
           self.faceUpViews(button: button, card: card)
        }, completion: nil)
    }
    
    func animateFaceDown(button : UIButton) {
        UIView.transition(with: button, duration: 0.4, options: .transitionFlipFromRight, animations: {
            self.faceDownViews(button: button)
        }, completion: nil)
    }
    
    func animateMathced(button : UIButton) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0, options: [], animations: {
            button.transform = CGAffineTransform.identity.scaledBy(x: 3.0, y: 3.0)
        }) { (position) in
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0, options: [], animations: {
                button.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1)
                button.alpha = 0
            }) { (position) in
                
            }
        }
    }
    
    func faceUpViews(button : UIButton, card : ExampleCardModel){
        button.setTitle(card.emoji, for: .normal)
        button.backgroundColor = UIColor.gray
    }
    
    func faceDownViews(button : UIButton) {
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.orange
    }
    
    func matchedViews(button : UIButton) {
         button.alpha = CGFloat(integerLiteral: 0)
    }
}
