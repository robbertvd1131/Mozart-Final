//
//  Utils.swift
//  MozartApp
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import UIKit

class Utils {
    
     static func moveVertically(component: UIView, height: CGFloat) {
        UIView.animateWithDuration(
            0.1,
            delay: 0.0,
            options: .CurveEaseInOut,
            animations: {
                component.frame.origin.y -= height
            },
            completion: nil)
    }
}