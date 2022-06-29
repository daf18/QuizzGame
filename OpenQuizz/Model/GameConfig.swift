//
//  GameConfig.swift
//  Labo 1
//
//  Created by Andreea Draghici on 2022-05-11.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import Foundation

class GameConfig {
    
    var userName = "defaultPlayer"
    
    static let shared = GameConfig()
    
    private init() { }
    
    func updatePlayerName(_ playerName: String?) -> String {
        if (playerName == nil || playerName == ""){
            userName = "defaultPlayer"
            return userName
        } else {
            userName = playerName!
            return userName
        }
    }

        
}



