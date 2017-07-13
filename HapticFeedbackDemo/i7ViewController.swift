//
//  i7ViewController.swift
//  HapticFeedbackDemo
//
//  Created by Mazvydas Bartasius on 08/07/2017.
//  Copyright © 2017 nerdmade. All rights reserved.
//

import UIKit

class i7ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Methods //
    
    //  .selection  // A collision between large, heavy user interface elements.
    func selection() {
        if #available(iOS 10.0, *) {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    //    .light     // Produces lightest tap, indicating that the user has changed a selection.
    func light() {
        if #available(iOS 10.0, *) {
            let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            lightImpactFeedbackGenerator.prepare()
            lightImpactFeedbackGenerator.impactOccurred()
        }
    }
    
    //    .medium    // A collision between small, light user interface elements.
    func medium() {
        if #available(iOS 10.0, *) {
            let mediumImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            mediumImpactFeedbackGenerator.prepare()
            mediumImpactFeedbackGenerator.impactOccurred()
        }
    }
    
    //    .heavy     // A collision between moderately sized user interface elements.
    func heavy() {
        if #available(iOS 10.0, *) {
            let heavyImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            heavyImpactFeedbackGenerator.prepare()
            heavyImpactFeedbackGenerator.impactOccurred()
        }
    }
    
    //    .success   // A notification feedback type, indicating that a task has completed successfully.
    func success() {
        if #available(iOS 10.0, *) {
            let successNotificationFeedbackGenerator = UINotificationFeedbackGenerator()
            successNotificationFeedbackGenerator.prepare()
            successNotificationFeedbackGenerator.notificationOccurred(.success)
        }
    }
    
    //    .warning   // A notification feedback type, indicating that a task has produced a warning.
    func warning() {
        if #available(iOS 10.0, *) {
            let warningNotificationFeedbackGenerator = UINotificationFeedbackGenerator()
            warningNotificationFeedbackGenerator.prepare()
            warningNotificationFeedbackGenerator.notificationOccurred(.warning)
        }
    }
    
    //    .error     // A notification feedback type, indicating that a task has failed.
    func error() {
        if #available(iOS 10.0, *) {
            let errorNotificationFeedbackGenerator = UINotificationFeedbackGenerator()
            errorNotificationFeedbackGenerator.prepare()
            errorNotificationFeedbackGenerator.notificationOccurred(.error)
        }
    }
    
    // Buttons //
    
    @IBAction func selection(_ sender: Any) {
        selection()
    }
    
    @IBAction func light(_ sender: Any) {
        light()
    }
    
    @IBAction func medium(_ sender: Any) {
        medium()
    }
    
    @IBAction func heavy(_ sender: Any) {
        heavy()
    }
    
    @IBAction func success(_ sender: Any) {
        success()
    }
    
    @IBAction func warning(_ sender: Any) {
        warning()
    }
    
    @IBAction func error(_ sender: Any) {
        error()
    }

    ////////////////////////////
    // Custom Haptic Feedback //
    ////////////////////////////

    var counter = 0
    var timer : Timer?
    
    func crazy() {
        counter += 1
        switch counter {
        case 1, 2, 3:
            medium()
        case 4, 5:
            heavy()
        case 6:
            warning()
            timer?.invalidate()
        default:
            timer?.invalidate()
        }
    }
    
    func superCrazy() {
        counter += 1
        switch counter {
        case 1, 2, 3, 4, 5, 6:
            medium()
        case 7, 8, 9, 10, 11:
            heavy()
        case 12:
            error()
            timer?.invalidate()
        default:
            timer?.invalidate()
        }
    }
    
    @IBAction func crazyButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.11, target: self, selector: #selector(i7ViewController.crazy), userInfo: nil, repeats: true)
    }
    
    @IBAction func superCrazyButton(_ sender: Any) {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 0.11, target: self, selector: #selector(i7ViewController.superCrazy), userInfo: nil, repeats: true)
    }
}
