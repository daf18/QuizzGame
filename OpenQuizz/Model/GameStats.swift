//
//  GameStats.swift
//  Labo 1
//
//  Created by Andreea Draghici on 2022-05-11.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import Foundation

class GameStats {
    
    var numberOfGames = 0
    var bestScore = 0
    var scoresGamesPlayed = Dictionary<String,Int>()
    
    static let shared = GameStats()
    
    private init() { }
    
    func storeBestScore(gameScore: Int) {
        if gameScore > GameStats.shared.bestScore {
                GameStats.shared.bestScore = gameScore

            }
    }
}


