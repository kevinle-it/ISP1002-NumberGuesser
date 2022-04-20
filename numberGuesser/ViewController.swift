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
            view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        } else {
            resultLabel.text = "better luck next time"
            let midVal = Double(maxVal) / 2
            let distance = Double(abs(guess-answerVal))
            var colorValue = 255*(1-(distance/Double(maxVal)))
            // Set lower limit for the color value to prevent dark or black screen
            if colorValue < 80 {
                colorValue = 80
            }
            if distance <= midVal {
                view.backgroundColor = UIColor(red: 0, green: CGFloat(colorValue/255.0), blue: 0, alpha: 1)
            } else {
                view.backgroundColor = UIColor(red: CGFloat(colorValue/255.0), green: 0, blue: 0, alpha: 1)
            }
        }
        resultLabel.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.resultLabel.alpha = 1
        } completion: { (didComplete) in
            UIView.animate(withDuration: 2) {
                self.resultLabel.alpha = 0
            }
        }
    }
    
    @IBAction func setGuess(_ sender: UISlider) {
        guessLabel.text = String(Int(sender.value))
    }
    
    @IBAction func changeDiff(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            guessSlider.maximumValue = 10
            guessSlider.tintColor = .systemBlue
        case 1:
            guessSlider.maximumValue = 100
            guessSlider.tintColor = .systemYellow
        case 2:
            guessSlider.maximumValue = 1000
            guessSlider.tintColor = .systemPurple
        default:
            guessSlider.maximumValue = 10
            guessSlider.tintColor = .systemBlue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = ""
        guessSlider.tintColor = .systemBlue
    }


}

