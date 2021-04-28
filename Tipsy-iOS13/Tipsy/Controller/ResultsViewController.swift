//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 김지호 on 2021/04/28.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var numberOfPeople = 0
    var tip = 0.0
    var calculateResult = 0.0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        totalLabel.text = String(format: "%.2f", calculateResult)
        settingsLabel.text = "split between \(numberOfPeople) with \(tip)% "
        super.viewDidLoad()

    
    }

    @IBAction func recalculaterBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
  
}
