//
//  ViewController.swift
//  Calculator
//
//  Created by Tarek Hany on 10/1/20.
//  Copyright © 2020 Tarek Hany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
       //What should happen when a non-number button is pressed
               
               isFinishedTypingNumber = true
               
               calculator.setNumber(displayValue)
               
               if let calcMethod = sender.currentTitle {
        
                   if let result = calculator.calculate(symbol: calcMethod) {
                       displayValue = result
                   }
               }
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
                if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }

    }
    
}
