//
//  DefaultMozartTextField.swift
//  login
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import UIKit
import Foundation

class DefaultMozartTextField: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // Text color
        self.textColor = UIColor.whiteColor()
        
        // Placeholder color
        self.attributedPlaceholder = NSAttributedString(string: (self.placeholder?.uppercaseString)!, attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        // Underline
        let width = CGFloat(0.40)
        let border = CALayer()
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        // Disable autocorrect
        self.autocorrectionType = UITextAutocorrectionType.No
    }
}
