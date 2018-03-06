//
//  Memories.swift
//  Memories
//
//  Created by Nikola Popovic on 3/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

class Memories {
    
    var indexOneAndOnlyFaceUpCard: Int?
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cars are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfChards : Int, withSuffle count: Int) {
        for _ in 1...numberOfPairsOfChards {
            let card = Card()
            cards += [card, card]
            // This is two new copied obeject in array of card.
        }
        shuffleCards(with: count)
    }
    
    func shuffleCards(with number: Int) {
        var temp = Card()
        let shuffleNumber = cards.count * number
        for _ in 1...shuffleNumber {
            let firstRandom = Int(arc4random_uniform(UInt32(cards.count)))
            let secondRandom = Int(arc4random_uniform(UInt32(cards.count)))
            if firstRandom != secondRandom {
                temp = cards[firstRandom]
                cards[firstRandom] = cards[secondRandom]
                cards[secondRandom] = temp
            }
        }
    }
}
