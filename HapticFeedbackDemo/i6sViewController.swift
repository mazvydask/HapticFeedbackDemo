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
//    .pop      //    Actuate `Pop` feedback (strong boom).
//    .error    //    Actuate `Error` feedback (series of three weak booms).
    
    @IBAction func peek(_ sender: Any) {
        return AudioServicesPlaySystemSound(1519)
    }
    
    @IBAction func pop(_ sender: Any) {
        return AudioServicesPlaySystemSound(1520)
    }
    
    @IBAction func error(_ sender: Any) {
        return AudioServicesPlaySystemSound(1521)
    }
    
}
