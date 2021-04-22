//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by 김지호 on 2021/04/22.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
 
    var quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
                
    ]
    var score = 0
    
    var questionNumber = 0
    
    func checkAnswer(_ userAnswer : String) -> Bool {
        if quiz[questionNumber].answer == userAnswer {
            return true
        }else{
            return false
        }
        
    }
    
    func getQuestionText() ->  String {
        return quiz[questionNumber].question
    }
    // progress Bar 현상태 메소드
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    //
    mutating func increaseScore(answerResult : Bool){
        if  answerResult {
            score += 1
        }
        
        
    }
     func getScore() -> Int{
        return score
    }
    
    
    
    mutating func nextQuestion() {
        // quiz 배열 사이즈 보다 작을때만  1, 2 < 3 (quiz.count) 사이즈
        // 총 두번만 라벨 갱신 필요하기때문
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else{
            // 모든 퀴즈가 끝나므로 처음 세팅 처럼 초기화
            questionNumber = 0
            score = 0
        }
    }
}
