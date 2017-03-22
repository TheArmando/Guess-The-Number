//
//  ViewController.swift
//  Guess The Number
//
//  Created by Armando Silveira on 3/19/17.
//  Copyright © 2017 Armando Silveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!

    
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess = 0 //: Int! // what, how does this work
    var numberOfGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateRandomNumber() {
        // arc4random_uniform(100) will generate numbers from 0 to 99
        // which is 100 numbers, but we want 1 from to 100
        numberToGuess = Int(arc4random_uniform(100)) + 1
        
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            }
        }
        
    }
    
    func validateGuess(_ guess: Int) {
        if guess < lowerBound || guess > upperBound {
            print("Your guess should be between 1 and 100!")
            showBoundsAlert()
        } else if guess < numberToGuess {
            //print("Higher!")
            textLabel.text = "Higher! ⬆️"
        } else if guess > numberToGuess {
            //print("Lower!")
            textLabel.text = "Lower! ⬇️"
        } else {
            print("You win!")
            showWinAlert()
            textLabel.text = "Guess The Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
        guessTextField.text = ""
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! 🎉", message: "You won with \(numberOfGuesses) guesses", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
}

