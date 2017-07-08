//
//  MockFeedbackViewController.swift
//  HapticFeedbackDemo
//
//  Created by Mazvydas Bartasius on 09/07/2017.
//  Copyright © 2017 nerdmade. All rights reserved.
//

import AudioToolbox
import UIKit

class MockFeedbackViewController: UIViewController {
    
    var counter = 0
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func success() {
        counter += 1
        switch counter {
        case 1:
            AudioServicesPlaySystemSound(1519)
        case 2:
            AudioServicesPlaySystemSound(1520)
        default:
            timer?.invalidate()
        }
    }
    
    func warning() {
        counter += 1
        switch counter {
        case 1:
            AudioServicesPlaySystemSound(1520)
        case 2:
            AudioServicesPlaySystemSound(1519)
        default:
            timer?.invalidate()
        }
    }
    
    func error() {
        counter += 1
        switch counter {
        case 1:
            AudioServicesPlaySystemSound(1519)
        case 2:
            AudioServicesPlaySystemSound(1519)
        case 3:
            AudioServicesPlaySystemSound(1520)
        case 4:
            AudioServicesPlaySystemSound(1519)
        default:
            timer?.invalidate()
        }
    }
    
    @IBAction func successButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(MockFeedbackViewController.success), userInfo: nil, repeats: true)
    }
    
    @IBAction func warningButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(MockFeedbackViewController.warning), userInfo: nil, repeats: true)
    }
    
    @IBAction func errorButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.11, target: self, selector: #selector(MockFeedbackViewController.error), userInfo: nil, repeats: true)
    }
    
}

