//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var labelArea: UILabel!
    @IBOutlet weak var choice1Pressed: UIButton!
    @IBOutlet weak var choice2Pressed: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    @IBAction func choicePressed(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        storyBrain.updateUI(pressedButton: userChoice)
        setupUI()
        
    }
    
    func setupUI()  {
        labelArea.text = storyBrain.getTitle()
        choice1Pressed.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Pressed.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}

