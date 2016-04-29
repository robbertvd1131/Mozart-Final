//
//  MenuMozartButton.swift
//  login
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import Foundation
import UIKit

class MenuMozartButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.5
        
        self.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        let imageSize: CGSize = self.imageView!.image!.size
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -112, 0.0)
        
        self.setTitle(self.titleLabel!.text!.uppercaseString, forState: .Normal)
        self.titleLabel!.font =  UIFont(name: "HelveticaNeue-Medium", size: 11)
        
        
        let decoView1 = UIView(frame: CGRectMake(40, 80, 2, 6))
        
        decoView1.backgroundColor=UIColor.whiteColor()
        
        self.addSubview(decoView1)
        
        
        let decoView2 = UIView(frame: CGRectMake(40, 105, 2, 6))
        
        decoView2.backgroundColor=UIColor.whiteColor()
        
        self.addSubview(decoView2)
        
    }
}
