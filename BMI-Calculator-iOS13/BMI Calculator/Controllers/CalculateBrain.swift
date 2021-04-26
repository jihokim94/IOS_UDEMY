//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by 김지호 on 2021/04/26.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain{
    
    var bmi : BMI?
    
    // 버튼 클릭시 BMI 에따라 BMI 구조체 초기화
    mutating func calculateBMI(height : Float , weight : Float) {
       let calculatedBMI = weight / (height * height)
        
        if calculatedBMI < 18.5{
            bmi = BMI(value: calculatedBMI, advice: "Eat more Calories", color: #colorLiteral(red: 0.1911517382, green: 0.9383479357, blue: 1, alpha: 1))
        }else if calculatedBMI < 24.9{
            bmi = BMI(value: calculatedBMI, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }else{
            bmi = BMI(value: calculatedBMI, advice: "Eat less than usual", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
       
    }
    func getBMIValue() -> String{
        return String(format: "%1.f", bmi?.value ?? "0.0")
    }
    func getBMIColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    func getBMIAdvice() -> String{
        return bmi?.advice ?? "NO RESULT"
    }
}
