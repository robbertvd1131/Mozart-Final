//
//  DefaultMozartButton.swift
//  login
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import UIKit
import Foundation


class DefaultMozartButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.clearColor()
        self.tintColor = UIColor.whiteColor()
        self.setTitle(self.titleLabel!.text!.uppercaseString, forState: .Normal)
        self.titleLabel!.font =  UIFont(name: "HelveticaNeue-Medium", size: 12)
    }
    
    override var enabled: Bool {
        didSet {
            if enabled {
                self.layer.borderColor = UIColor.whiteColor().CGColor
                self.tintColor = UIColor.whiteColor()
            } else {
                self.layer.borderColor = UIColor.darkGrayColor().CGColor
                self.tintColor = UIColor.grayColor()
            }
        }
    }
    
}