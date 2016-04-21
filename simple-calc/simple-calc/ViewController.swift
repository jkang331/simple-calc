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
    
    //when AC is pressed
    @IBAction func clearTextLabel(sender: UIButton) {
        textLabel.text = ""
        Solution.text = ""
    }
    
    //when = is pressed
    @IBAction func EvaluateInput(sender: UIButton) {
        Solution.text = getTextLabelText()
    }
    
    /************ Operator Buttons Pressed ************/
    
    @IBAction func modPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())%"
    }
    
    @IBAction func dividePressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())/"
    }
    
    @IBAction func multiplyPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())x"
    }
    
    @IBAction func subtractPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())-"
    }
    
    @IBAction func addPressed(sender: UIButton) {
        textLabel.text = "\(getTextLabelText())+"
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
    
    
    private func getTextLabelText() -> String {
        let text = textLabel!.text!
        return text
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

