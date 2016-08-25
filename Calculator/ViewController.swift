//
//  ViewController.swift
//  Calculator
//
//  Created by Chung on 8/24/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    
    @IBOutlet weak var distanceBetweenInputTextAndResultLabel: NSLayoutConstraint!
    @IBOutlet weak var heightMidView: NSLayoutConstraint!
    @IBOutlet weak var distanceBetweenMidView: NSLayoutConstraint!
    @IBOutlet weak var rationHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        updateConstranits()
    }
    
    func updateConstranits(){
        let scale = UIScreen.mainScreen().bounds.size.height / 667
//        print(62/(UIScreen.mainScreen().bounds.size.height - (19*4) - 64))
//        heightMidView = heightMidView.setMultiplier(62/(UIScreen.mainScreen().bounds.size.height - (19*4) - 64))
        distanceBetweenMidView.constant = -UIScreen.mainScreen().bounds.size.height * (62/660)/2
        distanceBetweenResultLabelAndMiddleView.constant = UIScreen.mainScreen().bounds.size.height > 480 ?
            distanceBetweenResultLabelAndMiddleView.constant * scale : distanceBetweenResultLabelAndMiddleView.constant * 0.1
        
        distanceBetweenInputTextAndResultLabel.constant = UIScreen.mainScreen().bounds.size.height > 480 ?
            distanceBetweenInputTextAndResultLabel.constant * scale : distanceBetweenInputTextAndResultLabel.constant * 0.1
    }
    
}

extension NSLayoutConstraint {
    
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        newConstraint.active = true
        
        NSLayoutConstraint.deactivateConstraints([self])
        NSLayoutConstraint.activateConstraints([newConstraint])
        return newConstraint
    }
}