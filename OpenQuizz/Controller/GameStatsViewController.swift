//
//  GameStatsViewController.swift
//  Labo 1
//
//  Created by Andreea Draghici on 2022-05-06.
//  Copyright ยฉ 2022 Ahuntsic. All rights reserved.
//

import UIKit

class GameStatsViewController: UIViewController {

    @IBOutlet weak var gameStatsLabel: UILabel!
    
    var playerScore = 0
    var nbOfGames = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStatsLabel.text = """
๐ฏ Parties jouรฉes :
 \(GameStats.shared.numberOfGames)
๐ Meuilleur score :
\(GameStats.shared.bestScore)

 ๐ TOP 5 ๐  \r\n

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
    

