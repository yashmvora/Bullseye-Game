//
//  ViewController.swift
//  Bullseye
//
//  Created by yash on 03/06/19.
//  Copyright © 2019 yash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var rounds = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var startoverOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue  = Int(slider.value.rounded())
        currentValue = roundedValue
        targetValue = Int.random(in: 1...100)
        startOverButton(startoverOutlet)
        
        /*let sliderbullseye = #imageLiteral(resourceName: "Bullseye1")
        let sliderLeftImage = #imageLiteral(resourceName: "green bar")
        let sliderRightImage = #imageLiteral(resourceName: "white rectangle")
        
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let sliderLeftResize = sliderLeftImage.resizableImage(withCapInsets: insets)
        let sliderRightResize = sliderRightImage.resizableImage(withCapInsets: insets)
        
        slider.setThumbImage(sliderbullseye, for: .normal)
        slider.setMinimumTrackImage(sliderLeftResize, for: .normal)
        slider.setMaximumTrackImage(sliderRightResize, for: .normal)*/

    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            if difference == 1{
            points += 51
            }
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOverButton(_ sender: UIButton) {
        score = 0
        rounds = 0
        startNewRound()
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue  = Int(slider.value.rounded())
        currentValue = roundedValue
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        rounds = rounds + 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(rounds)
    }
    
}

