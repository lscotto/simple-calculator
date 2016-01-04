//
//  ViewController.swift
//  simple-calculator
//
//  Created by lscotto on 12/31/15.
//  Copyright © 2015 Front Runner Designs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //ENUMERATIONS
    enum Operation: String {
        
        case Divide = "/"
        case Multply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        
    }
    
    
    //OUTLETS
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var decimalPointPressed: UIButton!
    
    //PROPERTIES
    var buttonSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    var decimal = "."
    
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("buttonsound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            
            //RUN MATHIMATICS
            rightValueString = runningNumber
            runningNumber = ""
            decimalPointPressed.enabled = true
            
            if currentOperation == Operation.Multply {
                
                result = "\(Double(leftValueString)! * Double(rightValueString)!)"
                
            } else if currentOperation == Operation.Divide {
                
                result = "\(Double(leftValueString)! / Double(rightValueString)!)"
                
            } else if currentOperation == Operation.Subtract {
                
                result = "\(Double(leftValueString)! - Double(rightValueString)!)"
                
            } else if currentOperation == Operation.Add {
                
                result = "\(Double(leftValueString)! + Double(rightValueString)!)"
                
            }
            
            leftValueString = result
            outputLabel.text = result
            
            currentOperation = op
            
        } else {
            
            //OPERATOR HAS BEEN PRESSED
            leftValueString = runningNumber
            runningNumber = ""
            currentOperation = op
            decimalPointPressed.enabled = true
            
        }
    }
    
    func playSound() {
        
        if buttonSound.playing {
            
            buttonSound.stop()
            
        }
        
        buttonSound.play()
        
    }
    
    
    //ACTIONS
    @IBAction func numberPressed(btn: UIButton!) {
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLabel.text = runningNumber
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        
        processOperation(Operation.Divide)
        
    }
    
    @IBAction func onMultplyPressed(sender: AnyObject) {
        
        processOperation(Operation.Multply)
        
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        
        processOperation(Operation.Subtract)
        
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        
        processOperation(Operation.Add)
        
        
    }
    
    @IBAction func onPeriodPressed(sender: AnyObject) {
        playSound()
        decimalPressed()
        
    }
    
    @IBAction func onClearPressed(sender: AnyObject) {
        
        runningNumber = "0"
        leftValueString = "0"
        rightValueString = "0"
        outputLabel.text = "0"
        decimalPointPressed.enabled = true

        processOperation(Operation.Empty)
        
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        
        processOperation(currentOperation)
        currentOperation = Operation.Empty
        decimalPointPressed.enabled = true
        
    }
    
    func decimalPressed() {
        
        if decimalPointPressed.enabled != false {
            
            runningNumber = "\(runningNumber)\(decimal)"
            outputLabel.text = "\(runningNumber)"
            decimalPointPressed.enabled = false
            
        } else {
            
        
            
        }
        
    }

    
    
    
}

