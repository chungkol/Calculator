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
    var isFirstOprerator: Bool = true
    
    
    
    
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
                isFirstOprerator = false
                
            }else{
                if !isFirstOprerator {
                    secondNumber = Double(inputTextfield.text!)!
                    let result: Double = math(opration,num1: firstNumber, numb2: secondNumber)
                                    lbResult.text = "\(result)"
                    firstNumber = Double(lbResult.text!)!
                    inputTextfield.text = "\(firstNumber)"
                }
                print("so 1 \(firstNumber)")
                print("so 2 \(secondNumber)")
          // khong phai lỗi ở dấu bằng lỗi ở phần click các dấu +/-/* để ra kết quả luôn ý
//                firstNumber = Double(lbResult.text!)!
//                inputTextfield.text = "\(firstNumber)"
            }
        }else{
            print("Bạn cần nhập số trước khi thực hiện tính toán")
        }
        isTappingNumber = false
        
        if opration == "%" {
            equalAction(sender)
        }else if opration == "+/-"{
            equalAction(sender)
        }
        
    }
    
    @IBAction func equalAction(sender: UIButton) {
        isTappingNumber = false
        if let realSecondNumb = Double(inputTextfield.text!) {
            secondNumber = realSecondNumb
        }
        let result: Double = math(opration,num1: firstNumber, numb2: secondNumber)
        lbResult.text = "\(result)"
    
        print("so 1 \(firstNumber)")
        print("so 2 \(secondNumber)")
        
    }
    func math(ope: String,var num1: Double,numb2: Double) -> Double{
        var result: Double = 0
        switch opration {
        case "+":
            result = num1 + numb2
        case "-":
            result = num1 - numb2
        case "*":
            result = num1 * numb2
        case "/":
            result = num1 / numb2
        case "%":
            result = num1 / 100
        case "+/-":
            if num1 < 0 {
                num1 = fabs(num1)
                result = num1
            }else{
                num1 = -1 * num1
                result = num1
            }
            inputTextfield.text = "\(result)"
            
        default:
            print("error Operation")
        }
        return result
        
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

