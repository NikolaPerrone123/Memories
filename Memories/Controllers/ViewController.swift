//
//  ViewController.swift
//  Memories
//
//  Created by Nikola Popovic on 3/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    // Lazy var means that object will be initialize when someoen have to use this object, not at this line. And lazy can't have property observer.
    lazy var game = Memories(numberOfPairsOfChards: (cardButtons.count) / 2, withSuffle: 30)
    
    // Prop observer
    var flipCount = 0 {
        didSet {
            lipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoices = ["👹","💩","👻","😈","😸","🎃","💩","🤖"]
    var emoji = [Int : String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func touchChard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let viewButton = cardButtons[index]
            let cardModel = game.cards[index]
            if cardModel.isFaceUp {
                viewButton.setTitle(emoji(for: cardModel), for: .normal)
                viewButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                viewButton.setTitle("", for: UIControlState.normal)
                viewButton.backgroundColor = cardModel.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]
//        } else {
//            return "?"
//        }
        
        // This line of code raplace all if else.
        return emoji[card.identifier] ?? "?"
    }
}

