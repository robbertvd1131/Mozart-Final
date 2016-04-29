//
//  MainMenuViewController.swift
//  login
//
//  Created by Fhict on 21-04-16.
//  Copyright © 2016 Lex Bauer. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Search for credentials
        let prefs = NSUserDefaults.standardUserDefaults()
        let username = prefs.stringForKey("username")
        
        // If not found, show login screen
        print("username is \(username)")
        if username == nil {
            showLogin()
        }
    }
    
    @IBAction func logOut(sender: UIButton) {
        // Delete credentials
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.removeObjectForKey("username")
        prefs.removeObjectForKey("password")
        
        showLogin()
    }
    
    func showLogin() {
        print("show login screen")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("loginVC") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
