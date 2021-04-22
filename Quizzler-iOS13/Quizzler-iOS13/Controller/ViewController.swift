//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButtonPressed: UIButton!
    @IBOutlet weak var falseButtonPressed: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let answerResult = quizBrain.checkAnswer(userAnswer)
        
        // 정답 체크
        if answerResult {
            print("Right!!")
            sender.backgroundColor = UIColor.green
            quizBrain.increaseScore(answerResult: true)
        }else{
            print("Wrong!!")
            sender.backgroundColor = UIColor.red
        }
       
        quizBrain.nextQuestion()
        // 버튼 클릭후 다음 질문으로 넘기기 0.2초 뒤에 그래야지 버튼 색깔의 변화가 보임
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
   @objc func updateUI() {
        
    progressBar.progress = quizBrain.getProgress()
    questionLabel.text = quizBrain.getQuestionText()
    scoreLabel.text = "Score \(quizBrain.getScore())"
        trueButtonPressed.backgroundColor = UIColor.clear
        falseButtonPressed.backgroundColor = UIColor.clear
    
    }
    
}

