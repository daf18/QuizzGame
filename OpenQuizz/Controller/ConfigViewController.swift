//
//  ConfigViewController.swift
//  Labo 1
//
//  Created by Andreea Draghici on 2022-05-06.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var playerLabel: UILabel!
        
    @IBAction func unwindToWelcome(segue: UIStoryboardSegue) { }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func setPlayerName(_ sender: Any) {
       let player = GameConfig.shared.updatePlayerName(nameTextField.text)
       playerLabel.text = player
    }
}
//pour faire disparaitre le clavier lors de l'appui du button continuer
extension ConfigViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


