//
//  ExapleModel.swift
//  Memories
//
//  Created by Nikola Popovic on 3/22/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

class ExapleGameModel {
    
    var listOfModel = [ExampleCardModel]()
    var indexOneAndOndlyCard : Int?
    private let emojis = ["♦️",  "♣️", "🎃", "👻"]
    
    init(numberOfPairs : Int, shuffelCard : Int) {
        for index in 0..<numberOfPairs {
            let card = ExampleCardModel(emoji: emojis[index])
            self.listOfModel.append(card)
            self.listOfModel.append(card)
             print(listOfModel)
        }
        shuffleCards(with: shuffelCard)
    }
    
    func cardSelect(selectedIndex : Int) {
        if !listOfModel[selectedIndex].isMatched {
            if let oneAndOnly = indexOneAndOndlyCard {
                if listOfModel[selectedIndex].id == oneAndOnly {
                    listOfModel[selectedIndex].isMatched = true
                    listOfModel[getIndexOneAndOnlyFaceUpCard(selectedIndex: selectedIndex)].isMatched = true
                }
                listOfModel[selectedIndex].isFaceUp = true
                listOfModel[selectedIndex].isSelcted = true
                indexOneAndOndlyCard = nil
            } else {
                for index in listOfModel.indices {
                    listOfModel[index].isFaceUp = false
                    listOfModel[index].isSelcted = false
                }
                listOfModel[selectedIndex].isFaceUp = true
                indexOneAndOndlyCard = listOfModel[selectedIndex].id
                listOfModel[selectedIndex].isSelcted = true
            }
        }
    }
    
    func shuffleCards(with number: Int) {
        var temp = ExampleCardModel()
        let shuffleNumber = listOfModel.count * number
        for _ in 1...shuffleNumber {
            let firstRandom = Int(arc4random_uniform(UInt32(listOfModel.count)))
            let secondRandom = Int(arc4random_uniform(UInt32(listOfModel.count)))
            if firstRandom != secondRandom {
                temp = listOfModel[firstRandom]
                listOfModel[firstRandom] = listOfModel[secondRandom]
                listOfModel[secondRandom] = temp
            }
        }
    }
    
    func getIndexOneAndOnlyFaceUpCard(selectedIndex : Int) -> Int {
        var res = -1
        for index in listOfModel.indices {
            if indexOneAndOndlyCard! == listOfModel[index].id && index != selectedIndex {
                res = index
            }
        }
        return res
    }
}

