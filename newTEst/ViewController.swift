//
//  ViewController.swift
//  newTEst
//
//  Created by Abigail Chin on 8/2/16.
//  Copyright © 2016 Abigail Chin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var counter = 0

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startTime(sender: AnyObject) {
        validateTimer()
        alternateButtons()
    }
    @IBAction func stopTime(sender: AnyObject) {
        timer.invalidate()
        alternateButtons()
        counter = 0
    }
    override func viewDidLoad() {//do these things as soon as you load
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopButton.enabled = false
        stopButton.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func alternateButtons(){
        startButton.enabled = !startButton.enabled
        startButton.hidden = !startButton.hidden
        
        stopButton.enabled = !stopButton.enabled
        stopButton.hidden = !stopButton.hidden
    }
    
    func validateTimer(){
        let repeatingFunction = #selector(ViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
    }
    
    func updateTime(){
        counter += 1
        timeLabel.text = "\(counter)"
    }
}

