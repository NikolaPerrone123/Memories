//
//  Chard.swift
//  Memories
//
//  Created by Nikola Popovic on 3/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var hashValue: Int {return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    var isSelected = false
    private var identifier: Int
    
    private static var identierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identierFactory += 1
        return identierFactory;
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
