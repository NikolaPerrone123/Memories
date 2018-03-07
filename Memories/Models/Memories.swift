//
//  Memories.swift
//  Memories
//
//  Created by Nikola Popovic on 3/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

class Memories {
    
    private(set) var cards = [Card]()
    
    private var indexOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        // If index doesn't exist, than dispaly this message from assert
        assert(cards.indices.contains(index), "Memories.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cars are face up
                indexOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfChards : Int, withSuffle count: Int) {
        assert(numberOfPairsOfChards < 1, "Memories.init(a \(numberOfPairsOfChards)): you must have at least one pair of cards")
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
    
    func removeGame(){
        self.cards.removeAll()
        self.indexOneAndOnlyFaceUpCard = nil
    }
}
