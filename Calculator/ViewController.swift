//
//  ViewController.swift
//  Calculator
//
//  Created by Chung on 8/24/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    
    @IBOutlet weak var distanceBetweenInputTextAndResultLabel: NSLayoutConstraint!
    @IBOutlet weak var heightMidView: NSLayoutConstraint!
    @IBOutlet weak var distanceBetweenMidView: NSLayoutConstraint!
    @IBOutlet weak var rationHeight: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var inputTextfield: UITextField!
    
    @IBOutlet weak var lbResult: UILabel!
    
    
    //mark: Variables
    
    var isTappingNumber : Bool = false
    var isEndOperation: Bool = true
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var opration: String = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextfield.userInteractionEnabled = false
    }
    
    
    @IBAction func numberAction(sender: UIButton) {
        
        let number = sender.currentTitle
        
        if isTappingNumber {
            inputTextfield.text = inputTextfield.text! + number!
        }else{
            inputTextfield.text = number
            isTappingNumber = true
        }
        
    }
    
    
    
    @IBAction func operatorsAction(sender: UIButton) {
        
        opration = sender.currentTitle!
        
        if let inputOperation = Double(inputTextfield.text!) {
            if isEndOperation {
                firstNumber = inputOperation
                isEndOperation = false
            }else{
                firstNumber = Double(lbResult.text!)!
                
                inputTextfield.text = "\(firstNumber)"
            }
        }else{
            print("Bạn cần nhập số trước khi thực hiện tính toán")
        }
        isTappingNumber = false
        
        if opration == "%" {
            equalAction(sender)
        }
    }
    
    @IBAction func equalAction(sender: UIButton) {
        isTappingNumber = false
        var result: Double = 0
        
        if let realSecondNumb = Double(inputTextfield.text!) {
            secondNumber = realSecondNumb
        }
        switch opration {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber / 100
        case "+/-":
            if firstNumber < 0 {
                firstNumber = fabs(firstNumber)
                result = firstNumber
            }else{
                firstNumber = -1 * firstNumber
                result = firstNumber
            }
            inputTextfield.text = "\(result)"
            
        default:
            print("error Operation")
        }
        lbResult.text = "\(result)"
    }
    
    
    @IBAction func ACAction(sender: UIButton) {
        
        firstNumber = 0
        secondNumber = 0
        inputTextfield.text = ""
        lbResult.text = "0"
        isEndOperation = true
    }
    
    
    
    
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        updateConstranits()
    }
    
    func updateConstranits(){
        let scale = UIScreen.mainScreen().bounds.size.height / 667
//        print(62/(UIScreen.mainScreen().bounds.size.height - (19*4) - 64))
//        heightMidView = heightMidView.setMultiplier(62/(UIScreen.mainScreen().bounds.size.height - (19*4) - 64))
        distanceBetweenMidView.constant = -UIScreen.mainScreen().bounds.size.height * 0.08/2
        distanceBetweenResultLabelAndMiddleView.constant = UIScreen.mainScreen().bounds.size.height > 480 ?
            distanceBetweenResultLabelAndMiddleView.constant * scale : distanceBetweenResultLabelAndMiddleView.constant * 0.1
        
        distanceBetweenInputTextAndResultLabel.constant = UIScreen.mainScreen().bounds.size.height > 480 ?
            distanceBetweenInputTextAndResultLabel.constant * scale : distanceBetweenInputTextAndResultLabel.constant * 0.1
    }
    
}

