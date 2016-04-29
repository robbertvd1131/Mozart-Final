//
//  RegisterViewController.swift
//  login
//
//  Created by Fhict on 15-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var imgMozart: UIImageView!
    @IBOutlet weak var txtName: DefaultMozartTextField!
    @IBOutlet weak var txtPassword: DefaultMozartTextField!
    @IBOutlet weak var txtConfirmPassword: DefaultMozartTextField!
    @IBOutlet weak var btnCreateAccount: DefaultMozartButton!
    
    let up:CGFloat = 1
    let down:CGFloat = -1
    var keyboardIsShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCreateAccount.enabled = false
        
        // Declare keyboard show and hide functions
        let center: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: #selector(RegisterViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(RegisterViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        // Declare textfield text edit functions
        txtName.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        txtPassword.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        txtConfirmPassword.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    @IBAction func close(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldDidChange(textField: UITextField) {
        // Disable the button if any textfield is empty
        btnCreateAccount.enabled = !(txtName.text!.isEmpty || txtPassword.text!.isEmpty || txtConfirmPassword.text!.isEmpty)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        txtName.resignFirstResponder()
        txtPassword.resignFirstResponder()
        txtConfirmPassword.resignFirstResponder()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if(keyboardIsShowing) {
            return
        }
        
        keyboardIsShowing = true
        moveText(up)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        moveText(down)
        keyboardIsShowing = false
    }
    
    func moveText(direction: CGFloat) {
        Utils.moveVertically(imgMozart,          height: direction * 200)
        Utils.moveVertically(txtName,            height: direction * 125)
        Utils.moveVertically(txtPassword,        height: direction * 112.5)
        Utils.moveVertically(txtConfirmPassword, height: direction * 100)
        Utils.moveVertically(btnCreateAccount,   height: direction * 87.5)
    }
}
