//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Nicholas Sutanto on 8/2/17.
//  Copyright © 2017 Nicholas Sutanto. All rights reserved.
//

import UIKit

// The enum "Shape" represents a play or move
enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}


class ResultViewController: UIViewController {

    // When the ResultsViewController is initialized a userChoice is passed in and an opponent's play is generated.
    var userChoice: Shape!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }

    

    @IBAction func playAgain(_ sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
}
