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
    var basicMathOperation = false
    var num1String : String = ""
    var opString : String = ""

    
    //when AC is pressed
    @IBAction func clearTextLabel(sender: UIButton) {
        textLabel.text = ""
        Solution.text = ""
        basicMathOperation = false
    }
    
    //when = is pressed
    @IBAction func EvaluateInput(sender: UIButton) {
        parseInput()
    }
    
    private func getTextLabelText() -> String {
        let text = textLabel!.text!
        return text
    }
    
    /************ Operator Buttons Pressed ************/
    
    @IBAction func modPressed(sender: UIButton) {
        num1String = getTextLabelText()
        opString = "%"
        textLabel.text = "\(getTextLabelText())%"
        basicMathOperation = true
    }
    
    @IBAction func dividePressed(sender: UIButton) {
        num1String = getTextLabelText()
        opString = "/"
        textLabel.text = "\(getTextLabelText())/"
        basicMathOperation = true
    }
    
    @IBAction func multiplyPressed(sender: UIButton) {
        num1String = getTextLabelText()
        opString = "x"
        textLabel.text = "\(getTextLabelText())x"
        basicMathOperation = true
    }
    
    @IBAction func subtractPressed(sender: UIButton) {
        num1String = getTextLabelText()
        opString = "-"
        textLabel.text = "\(getTextLabelText())-"
        basicMathOperation = true
    }
    
    @IBAction func addPressed(sender: UIButton) {
        num1String = getTextLabelText()
        opString = "+"
        textLabel.text = "\(getTextLabelText())+"
        basicMathOperation = true
    }
    
    
    
    /************ Number Buttons Pressed ************/
    
    @IBAction func onePressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())1"
    }
    
    @IBAction func twoPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())2"
    }
    
    @IBAction func threePressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())3"
    }
    
    @IBAction func fourPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())4"
    }
    
    @IBAction func fivePressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())5"
    }
    
    @IBAction func sixPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())6"
    }
    
    @IBAction func sevenPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())7"
    }
    
    @IBAction func eightPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())8"
    }
    
    @IBAction func ninePressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())9"
    }
    
    @IBAction func zeroPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())0"
    }
    
    

    /************ Calculation Methods ************/
    
    private func parseInput() {
        let input = getTextLabelText()
        if basicMathOperation {
            let num1 = num1String
            let num2 = String(input.substringFromIndex(input.characters.indexOf(Character(opString))!.successor()))
            simple (num1, num2String: num2)
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
    
    
    
    // Multi-operand Operations
    // - handles negative values (only for count and avg)
    // - handles doubles (only for count and avg)
    private func multi() {
        print("Enter multi-operand operations: count, avg, fact" )
        let input = readLine(stripNewline: true)
        let components = input?.componentsSeparatedByString(" ")
        let numComponents = Int((components?.count)! - 1)
        
        switch components![numComponents] {
        case "count":
            print("Number of input: \(numComponents)")
        case "avg":
            var total: Double = 0.0
            for index in 0...(numComponents - 1) {
                total = total + Double(components![index])!
            }
            total = total / Double(numComponents)
            print("Average of the input: \(total)")
        case "fact":
            if (numComponents != 1) {
                print("Sorry there should only be one input. Please try again.")
                return
            }
            var product = 1
            let firstInput = Int(components![0])
            if (firstInput == nil || firstInput! <= 0) {
                print("Sorry the value inputed was invalid please try again.")
                return
            }
            for index in 1...firstInput! {
                product = product * index
            }
            print("Factorial of \(firstInput!): \(product)")
        default:
            print("Not able to recognize input. Please try again.")
        }
        
    }
    
//    // Start of the main function
//    print("This is SimpleCalc.")
//    var menu: String = "\nMenu: \n\tTo compute a simple expression, input \"simple.\" \n\tTo compute a multi-operand, input \"multi.\" \n\tTo exit, input \"exit.\""
//    
//    print(menu)
//    var nextOperation = readLine(stripNewline: true)!
//    
//    while (nextOperation != "exit"){
//    switch nextOperation {
//    case "simple":
//    simple()
//    case "multi":
//    multi()
//    default:
//    print("Sorry incorrect command.  Please try again.")
//    }
//    
//    print(menu)
//    nextOperation = readLine(stripNewline: true)!
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

