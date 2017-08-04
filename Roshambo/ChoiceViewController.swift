//
//  ViewController.swift
//  Roshambo
//
//  Created by Nicholas Sutanto on 8/1/17.
//  Copyright © 2017 Nicholas Sutanto. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func playTheGame(_ sender: UIButton) {
        performSegue(withIdentifier: "segueShowResult", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowResult" {
            let vc = segue.destination as! ResultViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }

}

