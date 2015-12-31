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
    
    //OUTLETS
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    
    
    
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
    
    @IBAction func numberPressed(btn: UIButton!) {
        
        buttonSound.play()
        
    }
    
}

