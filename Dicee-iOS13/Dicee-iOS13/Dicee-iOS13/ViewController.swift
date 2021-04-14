//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImageView2.image = #imageLiteral(resourceName: "DiceFive")
        diceImageView1.alpha = 0.6
    }
    
    @IBAction func rollingDice(_ sender: UIButton) {
    
        let randomNumberForLeft = Int.random(in: 0...5);
        let randomNumberForRight = Int.random(in: 0...5);
    
        print("click button of rolling")
        diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceSix"),#imageLiteral(resourceName: "DiceFive")][randomNumberForLeft]
        diceImageView2.image = [#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceSix"),#imageLiteral(resourceName: "DiceFive")][randomNumberForRight]
        
       // diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceSix"),#imageLiteral(resourceName: "DiceFive")].randomElement()
        //diceImageView2.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceSix"),#imageLiteral(resourceName: "DiceFive")].randomElement()
        
    }
    
}

