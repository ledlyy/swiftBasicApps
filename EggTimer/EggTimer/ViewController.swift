//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 30, "Medium": 420, "Hard": 720]
    var secondPassed = 0
    var timer = Timer()
    var totalTime = 0
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var eggDone: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        eggDone.text = "How do you like your eggs?"
        timer.invalidate()
        secondPassed = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        eggDone.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    

    
    
    @objc func updateCounter() {
        //example functionality
        if totalTime > secondPassed {
            secondPassed += 1
            progressView.progress = (Float(secondPassed)/Float(totalTime))
            print("\(secondPassed) seconds passed")
            print(progressView.progress)
        }
        else{
            timer.invalidate()
            eggDone.text = "Done"
            playSound()
        }
        
        
    }
}
