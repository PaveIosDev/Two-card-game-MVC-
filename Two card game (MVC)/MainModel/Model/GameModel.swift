//
//  GameModel.swift
//  Two card game (MVC)
//
//  Created by Павел Яковенко on 13.06.2023.
//

import UIKit

class GameModel {
    
    var cards = [Card]()
    
    var firstCard: Int?
    
    init(numberPairCard: Int) {
        for index in 0..<numberPairCard {
            let card = Card(identifier: index)
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func selectCard(index: Int) {
        
        if !cards[index].isMatched {
            if let openedCard = firstCard, openedCard != index {
                if cards[openedCard].identifier == cards[index].identifier {
                    cards[openedCard].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                firstCard = nil
            } else {
                cards.indices.forEach{cards[$0].isFaceUp = false }
                cards[index].isFaceUp = true
                firstCard = index
            }
        }
    }
}
