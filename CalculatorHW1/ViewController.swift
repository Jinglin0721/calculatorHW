//
//  ViewController.swift
//  CalculatorHW1
//
//  Created by Jinglin Liu on 9/13/17.
//  Copyright © 2017 Jinglin Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberDis: Double = 0 //the number is currently input
    var currentInput: Double = 0
    var doingMath = false //doing matlab claculation
    var previousNumber: Double = 0 // the number inserted eailer
    var operation = 0 //the math operator was stored
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
    
        // the process of doing math operation which means previous number existed
        
        if doingMath == true {
            
            numberDis = Double(sender.tag-1)
            doingMath = false
            label.text = label.text! + String(numberDis)
            
        }
         // the process of typing the new number
        else{
            label.text = label.text! + String(sender.tag-1)
            numberDis = Double(label.text!)!
        }
        }
    
    @IBAction func operators(_ sender: UIButton) {
        if label.text != "" && sender.tag != 17 && sender.tag != 18{
            
            previousNumber = Double(label.text!)!
            
            if (sender.tag == 11 ) { //divide
                label.text = label.text! + "/"
            }
            else if (sender.tag == 12 ) { //multiply
                label.text = label.text! + "x"

            }
            else if (sender.tag == 13 ) {  //plus
                label.text = label.text! + "+"

            }
            else if (sender.tag == 14 ) {  //subtract
                label.text = label.text! + "-"

            }
            else if (sender.tag == 15 ) {  //(
                label.text = label.text! + "("
            }
            
            else if (sender.tag == 16 ) {  //subtract
                label.text = label.text! + ")"
            }
            
            else if (sender.tag == 19 ) {  //snegative sign
                label.text = "-" + String(sender.tag-1)
            }
            
            else if (sender.tag == 20 ) {  //decimal place
                label.text = label.text! + "." + String(sender.tag-1)
            }

            operation = sender.tag
            doingMath = true
        
        }
        
        // to do the overall math equation
        else if(sender.tag == 17) //equal sign
        {
            if operation == 11 //doing divide operation and show the result
            {
                result.text = String(previousNumber / numberDis)
            }
            
            else if operation == 12
            {
                result.text = String(previousNumber * numberDis)
            }
            
            else if operation == 13
            {
                result.text = String(previousNumber + numberDis)
            }
            
            else if operation == 14
            {
                result.text = String(previousNumber - numberDis)
            }
            
            else if operation == 19
            {
                numberDis = -numberDis
            }
            
           
        }
        
        // operating reset
        else if(sender.tag == 18) //reset
        {
            result.text = ""
            label.text = ""
            operation = 0
            numberDis = 0
            previousNumber = 0
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

