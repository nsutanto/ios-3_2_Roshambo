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
    
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var gameResult: UILabel!
    
    private let opponentChoice: Shape = Shape.randomShape()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }

    private func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        imageResult.image = UIImage(named: imageName)
        gameResult.text = text
    }

    

    @IBAction func playAgain(_ sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
}
