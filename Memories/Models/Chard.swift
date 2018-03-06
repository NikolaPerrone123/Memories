//
//  Chard.swift
//  Memories
//
//  Created by Nikola Popovic on 3/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identierFactory += 1
        return identierFactory;
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
