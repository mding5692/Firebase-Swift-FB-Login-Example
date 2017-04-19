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
    
    // For displaying results, uses a initializing closure
    let userInfoLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blue
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        label.text = "Loading user info..."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Setting up where our results appear
        self.userInfoLabel.center = view.center
        self.view.addSubview(self.userInfoLabel)
        notificationCenter.addObserver(self, selector: #selector(updateLabel), name: notifyToUpdateLabel, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Updates our current result label
    func updateLabel() {
        self.userInfoLabel.text = "ID: \(currUser.userID) & Name: \(currUser.name)"
    }
    
}
