//
//  OperatorsButton.swift
//  Calculator
//
//  Created by Chung on 8/24/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class OperatorsButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    func configureButton(){
        if tag == 101 {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        }
        
        layer.cornerRadius = 8.0
        titleLabel?.font = UIFont.systemFontOfSize(20)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}
