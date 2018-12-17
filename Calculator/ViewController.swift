//
//  ViewController.swift
//  Calculator
//
//  Created by Mark Meretzky on 12/17/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//  Calculator, pages 263-269 in App Development with Swift
//

import UIKit;

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0";
    }

    @IBAction func clear(_ sender: UIButton) {
        label.text = "0";
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let digit: String = titleLabel.text {
                if label.text == "0" {
                    label.text = "";
                }
                label.text! += digit;
            }
        }
    }
    
    @IBAction func decimalPointPressed(_ sender: UIButton) {
        if label.text == "0" {
            label.text = "";
        }
        label.text! += ".";
    }
    
    //Called when + - * / is pressed.
    
    @IBAction func operatorKeyPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let myOperator: String = titleLabel.text {
                label.text! += myOperator;
            }
        }
    }
    
    @IBAction func equalKeyPressed(_ sender: UIButton) {
        var s: String = label.text!;
        s = s.replacingOccurrences(of: "−", with: "-");
        s = s.replacingOccurrences(of: "×", with: "*");
        s = s.replacingOccurrences(of: "÷", with: ".0/");   //avoid Int division
        
        //Not attempting to detect syntax errors; would require Objective-C.
        let expression: NSExpression = NSExpression(format: s);
        if let result: NSNumber = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            label.text = result.stringValue;
        }
    }
}
