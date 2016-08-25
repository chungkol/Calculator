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
    }
    func configButton(){
        if tag == 101 {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        }else{
            backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 1)

        }
    }

}
