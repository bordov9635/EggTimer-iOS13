//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 10, "Medium" : 22, "Hard" : 72]
    
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
                
        print(eggTimes[hardness]!)
        
        var counter = eggTimes[hardness]!
        
        var secondsPassed = 0.0
        
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if counter > 0 {
                    print ("\(counter) seconds")
                    var progresses = Float(secondsPassed) / Float(self.eggTimes[hardness]!)
                    print(progresses)
                    self.progressBar.progress = progresses
                    counter -= 1
                    secondsPassed += 1.0
                } else {
                    Timer.invalidate()
                    self.titleLabel.text = "Done!"
                    self.progressBar.progress = 1.0
                }
            }
        
        
        
    }
    
}
