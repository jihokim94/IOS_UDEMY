//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var pay : Double? = 0.0
    var tipPersents : Double? = 0.1
    var stepperValue : Double? = 0.0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
       // 팁퍼센티치 눌렀을때 텍스트 입력 UI 내려감
        billTextField.endEditing(true)
         
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // 사용자가 누른 버튼만 isSelected 됨 색상 변경댐
        sender.isSelected = true
        // String("".dropLast()) 는 subString 문자열 마지막 퍼센트 짜름
        tipPersents = Double(String(sender.currentTitle!.dropLast()))! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = sender.value
        print(stepperValue!)
        splitNumberLabel.text = String(Int(stepperValue ?? 0))
    }
    
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        print(billTextField.text!)
        print(1 + tipPersents!)
        print("\(tipPersents ?? 0.0)")
        print(stepperValue!)
        let calculateValue = Double(billTextField.text!)! * (1 + tipPersents!) / stepperValue!
        let ValueDemical = String(format: "0.2f", calculateValue)
        pay = calculateValue
        
        print(ValueDemical)
       
        performSegue(withIdentifier: "ResultSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ResultsViewController
        destination.numberOfPeople = Int(stepperValue!)
        destination.tip = tipPersents! // struct구분 해야하는데 귀찮다 그냥 로직 이건 뭐건 여기다 할게요
        destination.calculateResult = pay ?? 0.0
        
    }
}

