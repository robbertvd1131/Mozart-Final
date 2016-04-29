//
//  DefaultMozartImageView.swift
//  login
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import UIKit
import Foundation

class DefaultMozartImageView: UIImageView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.5
    }
}
