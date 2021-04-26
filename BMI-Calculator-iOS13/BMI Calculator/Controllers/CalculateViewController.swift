//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    //    var bmiValue = "0.0"
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //slider value 를 상태레이블 표시를위한 문자열 포맷
        print( String(format: "%.2f", sender.value))
        let height = String(format: "%.2f", sender.value)
        heightLabel.text =  "\(height)m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print(String(format: "%.0f", sender.value))
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text  = "\(weight)Kg"
        // or (Int)sender.value 형변환시 가능!
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let mbi = weight / (height * height)
        print(mbi)
        // 버튼 클릭시 BMI property init
        calculateBrain.calculateBMI(height: height, weight: weight)
        
        // prepare에 준비된 세그웨이 대로 버튼 실행시 화면 전환
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{ // goToResult 라는 segue에서는 bmi의 값들 전달할 준비
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.advice = calculateBrain.getBMIAdvice()
            destinationVC.bmiValue = calculateBrain.getBMIValue()
            destinationVC.color = calculateBrain.getBMIColor()
        }
    }
}

