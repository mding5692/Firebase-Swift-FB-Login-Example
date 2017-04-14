//
//  LoggedInViewController.swift
//  Firebase-Swift-Login
//
//  Created by Michael Ding on 2017-03-16.
//  Copyright © 2017 Michael Ding. All rights reserved.
//

import Foundation
import UIKit

// Shows result after successfully logging in
class LoggedInView : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up where our results appear
        let userInfoLabel = UILabel()
        userInfoLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        userInfoLabel.center = view.center
        userInfoLabel.text = "Loading user data..."
        
        // Uses threading to load user data stored in currUser model class
        DispatchQueue.global(qos: .userInteractive).async {
            userInfoLabel.text = "FB User ID for this app: " + currUser.userID + "\n" + "Name: " + currUser.name
        
            DispatchQueue.main.async {
                // Reloads UILabel
                userInfoLabel.setNeedsDisplay()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
