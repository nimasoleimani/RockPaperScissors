//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Nima Soleimani on 4/26/17.
//  Copyright © 2017 Nima Soleimani. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign =  randomChoice.nextInt()
    switch sign {
    case 0: return .rock
    case 1: return .paper
    case 2: return .scissors
    default: return .rock
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        case .scissors: return "✌️"
        }
    }
    
    func compareSigns(opponentSign: Sign) -> GameState {
        switch opponentSign {
        case self:
            return GameState.draw
        case .rock:
            if self == .paper {
                return GameState.win
            } else {
                return GameState.lose
            }
        case .paper:
            if self == .scissors {
                return GameState.win
            } else {
                return GameState.lose
            }
        case .scissors:
            if self == .rock {
                return GameState.win
            }else {
                return GameState.lose
            }
        }
        
    }

}
