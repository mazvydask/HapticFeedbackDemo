//
//  i6sViewController.swift
//  HapticFeedbackDemo
//
//  Created by Mazvydas Bartasius on 08/07/2017.
//  Copyright © 2017 nerdmade. All rights reserved.
//

import AudioToolbox
import UIKit

class i6sViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    .peek     //    Actuate `Peek` feedback (weak boom).
    @IBAction func peek(_ sender: Any) {
        return AudioServicesPlaySystemSound(1519)
    }
    
    //    .pop      //    Actuate `Pop` feedback (strong boom).
    @IBAction func pop(_ sender: Any) {
        return AudioServicesPlaySystemSound(1520)
    }
    
    //    .error    //    Actuate `Error` feedback (series of three weak booms).
    @IBAction func error(_ sender: Any) {
        return AudioServicesPlaySystemSound(1521)
    }
    
    //    .vibrate  //    Continious `Vibrate` feedback (stardard vibration).
    @IBAction func vibrate(_ sender: Any) {
        return AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    ////////////////////////////
    // Custom Haptic Feedback //
    ////////////////////////////
    
    var counter = 0
    var timer : Timer?
    
    func success() {
        counter += 1
        switch counter {
        case 1:
            AudioServicesPlaySystemSound(1519)
        case 2:
            AudioServicesPlaySystemSound(1520)
            timer?.invalidate()
        default:
            timer?.invalidate()
        }
    }
    
    func crazy() {
        counter += 1
        switch counter {
        case 1, 2:
            AudioServicesPlaySystemSound(1519)
        case 3, 4:
            AudioServicesPlaySystemSound(1520)
        case 5, 6:
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            timer?.invalidate()
        default:
            timer?.invalidate()
        }
    }
    
    func superCrazy() {
        counter += 1
        switch counter {
        case 1, 2, 3, 4, 5, 6:
            AudioServicesPlaySystemSound(1519)
        case 7, 8, 9, 10, 11:
            AudioServicesPlaySystemSound(1520)
        case 12:
            AudioServicesPlaySystemSound(1521)
            timer?.invalidate()
        default:
            timer?.invalidate()
        }
    }
    
    
    @IBAction func successButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(i6sViewController.success), userInfo: nil, repeats: true)
    }
    
    @IBAction func crazyButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.11, target: self, selector: #selector(i6sViewController.crazy), userInfo: nil, repeats: true)
    }
    
    @IBAction func superCrazyButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(i6sViewController.superCrazy), userInfo: nil, repeats: true)
    }
}
