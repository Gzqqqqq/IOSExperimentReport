//
//  card.swift
//  GameSeven
//
//  Created by Guozhouqian on 2018/11/13.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false{
        didSet {
            if oldValue && !isFaceUp {
                isSeen = true
            }
        }
    }
    
    var isMatched = false
    var identifier: Int
    
    private(set) var isSeen = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
