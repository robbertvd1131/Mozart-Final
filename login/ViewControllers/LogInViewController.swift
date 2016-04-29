//
//  LogInViewController.swift
//  login
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var imgMozart: UIImageView!
    @IBOutlet weak var txtName: DefaultMozartTextField!
    @IBOutlet weak var txtPassword: DefaultMozartTextField!
    @IBOutlet weak var btnLogIn: DefaultMozartButton!
    @IBOutlet weak var btnSignUp: DefaultMozartButton!
    
    let up:CGFloat = 1
    let down:CGFloat = -1
    var keyboardIsShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogIn.enabled = false
        
        // Declare keyboard show and hide functions
        let center: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: #selector(LogInViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(LogInViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        // Declare textfield text edit functions
        txtName.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        txtPassword.addTarget(self, action: #selector(RegisterViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    @IBAction func logIn(sender: UIButton) {
        let username = txtName.text
        let password = txtPassword.text
        
        if username!.isEmpty || password!.isEmpty {
            print("username or password is empty")
            return
        }
        
        // Save login data
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue(username, forKey: "username")
        prefs.setValue(password, forKey: "password") // Unsave action. I'd encrypt password before storing
        
        // Close the screen
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func textFieldDidChange(textField: UITextField) {
        // Disable the button if any textfield is empty
        btnLogIn.enabled = !(txtName.text!.isEmpty || txtPassword.text!.isEmpty)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        txtName.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if(keyboardIsShowing) {
            return
        }
        
        keyboardIsShowing = true
        moveFields(up)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        moveFields(down)
        keyboardIsShowing = false
    }
    
    func moveFields(direction: CGFloat) {
        Utils.moveVertically(imgMozart,   height: direction * 200)
        Utils.moveVertically(txtName,     height: direction * 125)
        Utils.moveVertically(txtPassword, height: direction * 100)
        Utils.moveVertically(btnLogIn,    height: direction * 75)
    }
}
