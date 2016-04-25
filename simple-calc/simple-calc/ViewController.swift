//
//  ViewController.swift
//  simple-calc
//
//  Created by Jennifer Kang on 4/21/16.
//  Copyright © 2016 Jennifer Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var Solution: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    //Sorry not the best implementation but due to time constraints this is what I came up with
    var num1String : String = ""
    var opString : String = ""
    var basicMathOperation = false
    var countOp = false
    var avgOp = false
    var factOp = false
    var alreadyComputed = false

    
    
    //when AC is pressed
    @IBAction func clearTextLabel(sender: UIButton) {
        textLabel.text = ""
        Solution.text = ""
        errorLabel.text = ""
        
        num1String = ""
        opString = ""
        
        basicMathOperation = false
        countOp = false
        avgOp = false
        factOp = false
        alreadyComputed = false
        
    }
    
    //when = is pressed
    @IBAction func EvaluateInput(sender: UIButton) {
        if !alreadyComputed {
            alreadyComputed = true
            computeInput()
        } else {
            errorLabel.text = "Sorry only 1 equation at a time. \n Please clear and try again."
        }
    }
    
    private func getTextLabelText() -> String {
        let text = textLabel!.text!
        return text
    }
    
    /************ Multi-Operand Buttons Pressed ************/
    
    @IBAction func countPressed(sender: UIButton) {
        countOp = true
        textLabel.text = "\(getTextLabelText()) count "
    }
    
    @IBAction func avgPressed(sender: UIButton) {
        avgOp = true
        textLabel.text = "\(getTextLabelText()) avg "
    }
    
    @IBAction func factPressed(sender: UIButton) {
        factOp = true
        if num1String == "" {
            num1String = getTextLabelText()
        }
        textLabel.text = "\(getTextLabelText()) fact "
    }
    
    /************ Operator Buttons Pressed ************/
    
    @IBAction func basicMathOperation(sender: UIButton) {
        if (basicMathOperation == false && num1String == "") {
            num1String = getTextLabelText()
            opString = sender.currentTitle!
        
            textLabel.text = "\(num1String)\(opString)"
            basicMathOperation = true
        }
    }
    
    
    
    /************ Number Buttons Pressed ************/
    
    @IBAction func numberButtonPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())\(sender.currentTitle!)"
    }
    

    /************ Calculation Methods ************/
    
    private func computeInput() {
        let input = getTextLabelText()
        
        // Verify there's only one operator
        //  - would have put some kinda checked to make sure there's only one operation in the input
        //    or maybe just disable the operator buttons when one has been selected
        
        if basicMathOperation {
            let num1 = num1String
            let num2 = String(input.substringFromIndex(input.characters.indexOf(Character(opString))!.successor()))
            simple (num1, num2String: num2)
            
        } else if countOp {
            var countNums = input.componentsSeparatedByString(" count ")
            while countNums.contains(""){
                let index = countNums.indexOf("")
                countNums.removeAtIndex(index!)
            }
            Solution.text = "\(countNums.count)"
            
        } else if avgOp {
            var avgNums = input.componentsSeparatedByString(" avg ")
            while avgNums.contains(""){
                let index = avgNums.indexOf("")
                avgNums.removeAtIndex(index!)
            }
            var total: Double = 0.0
            for index in 0...(avgNums.count - 1) {
                total = total + Double(avgNums[index])!
            }
            total = total / Double(avgNums.count)
            Solution.text = "\(total)"
            
        } else if factOp {
            if (input.componentsSeparatedByString("fact").count > 2) {
                Solution.text = "invalid input"
                return
            }
            
            var product = 1
            let firstInput = Int(num1String)
            if (firstInput == nil || firstInput! <= 0) {
                Solution.text = "invalid input"
                return
            }
            for index in 1...firstInput! {
                product = product * index
            }
            Solution.text = "\(product)"
        }
    }
    
    // Basic Mathematic Operations
    private func simple(num1String : String, num2String : String){
        let num1 = Int.init(num1String)!
        let num2 = Int.init(num2String)!
        
        var total: Int = 0
        var computedCorrectly = true
        
        switch opString {
        case "+":
            total = num1 + num2
        case "-":
            total = num1 - num2
        case "*","x":
            total = num1 * num2
        case "/":
            total = num1 / num2
        case "%":
            total = num1 % num2
        default:
            computedCorrectly = false
            Solution.text = "operator does not compute"
        }
        
        if computedCorrectly {
            Solution.text = "\(total)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

