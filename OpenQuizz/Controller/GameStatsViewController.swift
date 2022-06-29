//
//  GameStatsViewController.swift
//  Labo 1
//
//  Created by Andreea Draghici on 2022-05-06.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import UIKit

class GameStatsViewController: UIViewController {

    @IBOutlet weak var gameStatsLabel: UILabel!
    
    var playerScore = 0
    var nbOfGames = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStatsLabel.text = """
🎯 Parties jouées :
 \(GameStats.shared.numberOfGames)
🏆 Meuilleur score :
\(GameStats.shared.bestScore)

 👑 TOP 5 👑  \r\n

"""
  topFive()
        
    }
    
     func topFive() {
        var i = 0
        let sortedByValueDictionary = GameStats.shared.scoresGamesPlayed.sorted { (first, second) -> Bool in
            return first.value > second.value }

             for (player , scores) in sortedByValueDictionary {
                 if i<5 {
                 gameStatsLabel.text! += "\(player) : \(scores) \r\n"
                     i += 1
                 }
             }
         }
    
    }
    

