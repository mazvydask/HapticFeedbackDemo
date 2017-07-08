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
    
//    .light     // Produces lightest tap, indicating that the user has changed a selection.
    
//    .medium    // A collision between small, light user interface elements.
    
//    .heavy     // A collision between moderately sized user interface elements.
    
//    .selection // A collision between large, heavy user interface elements.
    
//    .success   // A notification feedback type, indicating that a task has completed successfully.
    
//    .warning   // A notification feedback type, indicating that a task has produced a warning.
    
//    .error     // A notification feedback type, indicating that a task has failed.
    
    @IBAction func selection(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    @IBAction func light(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            lightImpactFeedbackGenerator.prepare()
            lightImpactFeedbackGenerator.impactOccurred()
        }
    }
    
    @IBAction func medium(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let mediumImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            mediumImpactFeedbackGenerator.prepare()
            mediumImpactFeedbackGenerator.impactOccurred()
        }
    }
    
    @IBAction func heavy(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let heavyImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            heavyImpactFeedbackGenerator.prepare()
            heavyImpactFeedbackGenerator.impactOccurred()
        }
    }
    
    @IBAction func success(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let successNotificationFeedbackGenerator = UINotificationFeedbackGenerator()
            successNotificationFeedbackGenerator.prepare()
            successNotificationFeedbackGenerator.notificationOccurred(.success)
        }
    }
    
    @IBAction func warning(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let warningNotificationFeedbackGenerator = UINotificationFeedbackGenerator()
            warningNotificationFeedbackGenerator.prepare()
            warningNotificationFeedbackGenerator.notificationOccurred(.warning)
        }
    }
    
    @IBAction func error(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let errorNotificationFeedbackGenerator = UINotificationFeedbackGenerator()
            errorNotificationFeedbackGenerator.prepare()
            errorNotificationFeedbackGenerator.notificationOccurred(.error)
        }
    }

}
