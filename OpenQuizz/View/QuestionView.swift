//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Vincent Leduc on 2020-06-10.
//  Copyright © 2020 Ahuntsic. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    enum Style {
        case correct, incorrect, standard
    }

    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!

    var title = ""
    {
        didSet {
            label.text = title
        }
    }
    
    var style : Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    
  private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            backgroundColor = UIColor(red: 200.0/255.0, green: 236.0/255.0, blue: 160.0/255.0, alpha: 1) // Vert
            //backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            // icon.image = UIImage(named: "Icon Correct")
            icon.isHidden = false
            icon.image = #imageLiteral(resourceName: "Icon Correct")
        case .incorrect:
            backgroundColor = UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1) // Rouge
            icon.isHidden = false
            icon.image = #imageLiteral(resourceName: "Icon Error")
        case .standard:
            backgroundColor = UIColor(red: 191.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1) // Gris
            icon.isHidden = true
        }
    }
}
