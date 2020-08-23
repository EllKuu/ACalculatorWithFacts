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
    
    var num1: Float?
    var num2: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    
    
    @IBAction func clearTapped(_ sender: Any) {
        numberLabel.text = "0"
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
    }
    
    @IBAction func multiplyTapped(_ sender: Any) {
    }
    
    @IBAction func subtractionTapped(_ sender: Any) {
    }
    
    @IBAction func additionTapped(_ sender: Any) {
    }
    
    @IBAction func equalTapped(_ sender: Any) {
    }
    
    @IBAction func decimalTapped(_ sender: Any) {
    }
    
    @IBAction func numberTapped(num: UIButton){
        switch  num.tag{
        case 0:
            checkIfFirstNumIsZero(num: 0)
        case 1:
            checkIfFirstNumIsZero(num: 1)
        case 2:
            checkIfFirstNumIsZero(num: 2)
        case 3:
            checkIfFirstNumIsZero(num: 3)
        case 4:
           checkIfFirstNumIsZero(num: 4)
        case 5:
            checkIfFirstNumIsZero(num: 5)
        case 6:
            checkIfFirstNumIsZero(num: 6)
        case 7:
            checkIfFirstNumIsZero(num: 7)
        case 8:
            checkIfFirstNumIsZero(num: 8)
        case 9:
            checkIfFirstNumIsZero(num: 9)
        default:
            break

        }
    }
    
    func checkIfFirstNumIsZero(num: Int){
        if numberLabel.text == "0" && num == 0{
            numberLabel.text = "0"
        }
        else if numberLabel.text == "0" && num > 0{
            numberLabel.text = "\(num)"
        }else{
            numberLabel.text! += "\(num)"
        }
    }
    
    
    
    
}

