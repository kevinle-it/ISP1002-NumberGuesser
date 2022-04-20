//
//  ViewController.swift
//  numberGuesser
//
//  Created by Cambrian on 2022-04-11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessSlider: UISlider!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func showAnswer(_ sender: Any) {
        let maxVal = Int(guessSlider.maximumValue)
        let answerVal = Int.random(in: 0...maxVal)
        let guess = Int(guessSlider.value)
        
        answerLabel.text = String(answerVal)
        
        if(answerVal == guess){
            resultLabel.text = "congratulations"
        } else {
            resultLabel.text = "better luck next time"
        }
    }
    
    @IBAction func setGuess(_ sender: UISlider) {
        guessLabel.text = String(Int(sender.value))
    }
    
    @IBAction func changeDiff(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            guessSlider.maximumValue = 10
        case 1:
            guessSlider.maximumValue = 100
        case 2:
            guessSlider.maximumValue = 1000
        default:
            guessSlider.maximumValue = 10
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = ""

    }


}

