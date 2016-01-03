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
    
    
    //PROPERTIES
    var buttonSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var currentOperation: Operation = Operation.Empty
    
    
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
    
    func playSound() {
        
        
        
    }
    
    
    //ACTIONS
    @IBAction func numberPressed(btn: UIButton!) {
        buttonSound.play()
        
        runningNumber += "\(btn.tag)"
        outputLabel.text = runningNumber
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func onMultplyPressed(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func onPeriodPressed(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func onClearPressed(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        
        
        
    }
    
}

