//
//  ViewController.swift
//  BullsEye2
//
//  Created by AamirsMac on 12/03/19.
//  Copyright © 2019 AamirsMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue : Int = 0
  var targetValue : Int = 0
  var score = 0
  var round = 0

  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let roundedValue : Float = slider.value.rounded()
    currentValue = Int(roundedValue)
    
    startNewRound()
  }
  
  @IBAction func showAlert(_ sender: UIButton) {
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference
   
    
    
    
    
    let title : String
    if difference == 0 {
      title = "Perfect"
      points += 100
    } else if difference < 5 {
      if difference == 1 {
        points += 50
      }
      title = "You almost had it!"
    } else if difference < 10 {
      title = "Pretty Good!"
    } else {
      title = "Not even close..."
    }
    
    score += points
    
    let messege : String = "The Value of the Slider is Now: \(currentValue) \n" +
    "The target value is: \(targetValue)"
    
    let alert = UIAlertController(title: title, message:  messege, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: {
      action in
      self.startNewRound()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
   
  }
  
  @IBAction func SliderMoved(_ slider: UISlider) {
    let roundedValue : Float = slider.value.rounded()
    currentValue = Int(roundedValue)
  }
  
  func startNewRound () {
    targetValue = Int.random(in: 1 ... 100)
    currentValue = 50
    slider.value = Float(currentValue)
    round += 1
    updateLabels()
  }
  
  func updateLabels () {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
}


