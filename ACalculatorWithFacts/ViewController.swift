//
//  ViewController.swift
//  ACalculatorWithFacts
//
//  Created by elliott kung on 2020-08-22.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var divisionBtnLabel: UIButton!
    @IBOutlet weak var multiplyBtnLabel: UIButton!
    @IBOutlet weak var subtractionBtnLabel: UIButton!
    @IBOutlet weak var additionBtnLabel: UIButton!
    var buttons = [UIButton]()
    
    var savedNum1: Float!
    var savedNum2: Float!
    var result: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons += [divisionBtnLabel, multiplyBtnLabel, additionBtnLabel, subtractionBtnLabel]
        numberLabel.text = "0"
        
    }
    
    // MARK: calculator button functions
    @IBAction func clearTapped(_ sender: Any) {
        numberLabel.text = "0"
        savedNum1 = nil
        savedNum2 = nil
        result = nil
        for button in buttons{
            button.tintColor = UIColor.blue
        }
    }
    
    @IBAction func plusMinusTapped(_ sender: Any) {
        if numberLabel.text!.hasPrefix("-"){
            numberLabel.text!.removeFirst()
        }else{
            numberLabel.text!.insert("-", at: numberLabel.text!.startIndex)
        }
        
    }
    
    @IBAction func percentTapped(_ sender: Any) {
    }
    
    @IBAction func divisionTapped(_ sender: Any) {
        divisionBtnLabel.tintColor = UIColor.red
        calculate(num: divisionBtnLabel)
    }
    
    @IBAction func multiplyTapped(_ sender: Any) {
        multiplyBtnLabel.tintColor = UIColor.red
        calculate(num: multiplyBtnLabel)
    }
    
    @IBAction func subtractionTapped(_ sender: Any) {
        subtractionBtnLabel.tintColor = UIColor.red
        calculate(num: subtractionBtnLabel)
    }
    
    @IBAction func additionTapped(_ sender: Any) {
        additionBtnLabel.tintColor = UIColor.red
        calculate(num: additionBtnLabel)
        
    }
    
    @IBAction func equalTapped(_ sender: Any) {
        
    }
    
    @IBAction func decimalTapped(_ sender: Any) {
        if numberLabel.text!.firstIndex(of: ".") == nil{
            numberLabel.text! += "."
        }
        
    }
    
    @IBAction func numberTapped(num: UIButton){
        for button in buttons{
            button.tintColor = UIColor.blue
        }
        
        switch  num.tag{
        case 0:
            checkNums(num: 0)
        case 1:
            checkNums(num: 1)
        case 2:
            checkNums(num: 2)
        case 3:
            checkNums(num: 3)
        case 4:
            checkNums(num: 4)
        case 5:
            checkNums(num: 5)
        case 6:
            checkNums(num: 6)
        case 7:
            checkNums(num: 7)
        case 8:
            checkNums(num: 8)
        case 9:
            checkNums(num: 9)
        default:
            break
            
        }
    }
    
    // MARK: Calculator functions
    
    func checkNums(num: Int){
        // check if any number has been input by user
        if savedNum1 == nil && savedNum2 == nil{
            if numberLabel.text == "0" && num == 0{
                numberLabel.text = "0"
            }
            else if numberLabel.text == "0" && num > 0{
                numberLabel.text = "\(num)"
            }
            else{
                numberLabel.text! += "\(num)"
            }
        }
        // user has input a number and selected a math function to perform, this catches the users 2nd number
        else if savedNum1 != nil && savedNum2 == nil {
            numberLabel.text = "\(num)"
            savedNum2 = Float(numberLabel.text!)
        }
        // will add any additional numbers to the string if the user taps more numbers and place the result in savedNum2
        else if savedNum1 != nil && savedNum2 != nil{
            numberLabel.text! += "\(num)"
            savedNum2 = Float(numberLabel.text!)
            
        }
        
    }
    
    func calculate(num: UIButton){
        
        // user has selected a math function check if savedNum1 has no value and store text as a float
        if savedNum1 == nil {
            savedNum1 = Float(numberLabel.text!)
        }
        
        // both saved nums contain a value and a math function can be performed
        if savedNum1 != nil && savedNum2 != nil{
            switch num.tag {
                   case 11:
                       // equals
                       print("=")
                   case 12: // addition
                       result = savedNum1 + savedNum2
                   case 13:
                       //minus
                       result = savedNum1 - savedNum2
                   case 14:
                       // multiplication
                       result = savedNum1 * savedNum2
                   case 15:
                       // division
                       result = savedNum1 / savedNum2
                   default:
                       break
                   }
            numberLabel.text = String(result)
            savedNum1 = result
            savedNum2 = nil
        }
       
    }
    
    
    
    
}

