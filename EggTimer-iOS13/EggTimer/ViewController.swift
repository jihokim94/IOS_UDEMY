//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation // 꼭 오디오 플레이를 위해서는 데이타 셋 임포트 해야한다
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 3 , "Medium": 4 , "Hard":  7]
    
    var timer  = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player : AVAudioPlayer!
   
    
    
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        //print(sender.currentTitle)
        
        // 버튼 클릭시 초기 ui설정
        progressBar.progress = 0.0
        titleLabel.text = sender.currentTitle!
        secondsPassed = 0
        totalTime = 0
        timer.invalidate() // 기존 실행되는 것을 끄고 다시시작하기 위함
        
        
        let hardness  = sender.currentTitle!
        //        option을 누른상태로 currentTitle 을 보면 옵셔널로 지정되있것을 확인 할 수 있다.
        //        그러므로 순수 value 값을 원할 시 바인딩이나 !를 통해 뽑아야함
        //         Dictionary 또한 옵셔널 타입으로 출력됨
        //       print(eggTimes[hardness])
        let result = eggTimes[hardness]!
        print(result)
        
        // 시간 저장
        totalTime = result
        
        
        
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self , selector: #selector(countdown), userInfo: nil, repeats: true)
        /*
         timeInterval : 시간 간격  , target : 타이머가 실행될때 지정된 메세지를 보낼 개체  , selector : 시간 간격 당 작동 해야할 오브젝트씨 함수
         userInfo :  , repeats : 반복 수행할지 여부 보통 true
         
         */
        
    }
    // 타이머 시간 간격 당 이벤트 
    @objc func countdown() -> Void {
        if  secondsPassed < totalTime  {
            secondsPassed += 1
        
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime)) // progress 퍼센티지 상황 디버그 체크용
            
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
        
    }
  
    func playSound(){
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}

