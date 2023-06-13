//
//  CardModel.swift
//  Two card game (MVC)
//
//  Created by Павел Яковенко on 13.06.2023.
//

import UIKit

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier = 0
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}
