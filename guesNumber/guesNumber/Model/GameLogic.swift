//
//  GameLogic.swift
//  guesNumber
//
//  Created by  Максим Мартынов on 02.11.2022.
//

import Foundation

enum GameState {
    case newGame
    case startedNG
    case endGame
}

class GameLogic {
    var state: GameState = .newGame
    
    private var min: Int = 1
    private var max: Int = 100
    private var answer: Int = 0
    var computerTriesCount = 0
    
    func bigger() -> String {
        min = answer + 1
            return guess()
    }
    
    func smaller() -> String {
            max = answer
            return guess()
    }
    
    func equals() -> String {
        min = max
        return guess()
    }
    
   private func guess() -> String {
       if min == max {
           state = .endGame
           return "ваше число = \(answer)"
       } else {
           answer = (min + max) / 2
           return "Ваше число = \(answer)?"
       }
    }
}
