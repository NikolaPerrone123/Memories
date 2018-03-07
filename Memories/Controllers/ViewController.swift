//
//  ViewController.swift
//  Memories
//
//  Created by Nikola Popovic on 3/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var lipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    // Lazy var means that object will be initialize when someone has to use this object, not at this line. And lazy can't have property observer like filpCount prop.
    private lazy var game = Memories(numberOfPairsOfChards: numberOfPairsCards, withSuffle: 30)
    
    // Computed prop
    var numberOfPairsCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    // Prop observer
    private(set) var flipCount = 0 {
        didSet {
            lipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    private var emojiChoices = ["👹","💩","👻","😈","😸","🎃","😂","🤖"]
    private var emoji = [Card : String]()
    
    
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
    
    @IBAction func newGameAction(_ sender: Any) {
        newGame()
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
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]
//        } else {
//            return "?"
//        }
        
        // This line of code raplace all if else.
        return emoji[card] ?? "?"
    }
    
    private func newGame(){
        game.removeGame()
        emoji.removeAll()
        flipCount = 0
        game = Memories(numberOfPairsOfChards: (cardButtons.count + 1) / 2, withSuffle: 20)
        updateViewFromModel()
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

