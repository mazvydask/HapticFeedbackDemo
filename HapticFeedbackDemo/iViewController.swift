//
//  iViewController.swift
//  HapticFeedbackDemo
//
//  Created by Mazvydas Bartasius on 08/07/2017.
//  Copyright © 2017 nerdmade. All rights reserved.
//

import AudioToolbox
import GBDeviceInfo
import UIKit

class iViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private enum HapticFeedbackVersion {
        case new
        case old
    }
    
    private var hapticFeedbackVersionForCurrentDevice: HapticFeedbackVersion {
        switch GBDeviceInfo.deviceInfo().model {
        case .modeliPhone7, .modeliPhone7Plus:
            return .new
        default:
            return .old
        }
    }
    
    @IBAction func light(_ sender: Any) {
        if #available(iOS 10.0, *), hapticFeedbackVersionForCurrentDevice == .new {
            let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            lightImpactFeedbackGenerator.prepare()
            lightImpactFeedbackGenerator.impactOccurred()
        } else {
            return AudioServicesPlaySystemSound(1519)
        }
    }
    
    @IBAction func strong(_ sender: Any) {
        if #available(iOS 10.0, *), hapticFeedbackVersionForCurrentDevice == .new {
            let strongImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            strongImpactFeedbackGenerator.prepare()
            strongImpactFeedbackGenerator.impactOccurred()
        } else {
            return AudioServicesPlaySystemSound(1520)
        }
    }
    
    @IBAction func error(_ sender: Any) {
        if #available(iOS 10.0, *), hapticFeedbackVersionForCurrentDevice == .new {
            let errorImpactFeedbackGenerator = UINotificationFeedbackGenerator()
            errorImpactFeedbackGenerator.prepare()
            errorImpactFeedbackGenerator.notificationOccurred(.error)
        } else {
            return AudioServicesPlaySystemSound(1521)
        }
    }
}
