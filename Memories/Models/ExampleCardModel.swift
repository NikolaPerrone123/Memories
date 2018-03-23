//
//  ExampleCardModel.swift
//  Memories
//
//  Created by Nikola Popovic on 3/22/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

struct ExampleCardModel {
    
    var isFaceUp = false
    var isMatched = false
    var isSelcted = false
    var id = 0
    var emoji = ""
    
    
    static private var identifier = 0
    
    init(emoji : String) {
        self.id = ExampleCardModel.idenfierFactory()
        self.emoji = emoji
    }
    
    init() {
        
    }
    
    static func idenfierFactory() -> Int {
        identifier += 1
        return identifier
    }
    
}
