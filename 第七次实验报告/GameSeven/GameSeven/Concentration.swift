//
//  Concentration.swift
//  GameSeven
//
//  Created by Guozhouqian on 2018/11/13.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    var score = 0
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            if let machIndex = indexOfOneAndOnlyFaceUpCard, machIndex != index{
                if cards[machIndex].identifier == cards[index].identifier{
                    cards[machIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }else{
                    if cards[machIndex].isSeen {
                        score -= 1
                    }
                    if cards[index].isSeen {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
        cards.sort { _,_ in arc4random_uniform(2) > 0 }
    }
}
