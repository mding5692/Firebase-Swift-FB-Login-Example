//
//  ViewController.swift
//  Firebase-Swift-Login
//
//  Created by Michael Ding on 2017-03-16.
//  Copyright © 2017 Michael Ding. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore
import FacebookLogin


class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Sets up all login buttons etc.
    func setUpSubViews() {
        // Can try other subview setting up here
        setUpLoginButton()
    }
    
    // Adds Login button to the screen
    func setUpLoginButton() {
        // Custom Login Button initialization
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor.darkGray
        loginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        loginButton.center = view.center;
        loginButton.setTitle("Login via FB", for: .normal)

        // Handles login
        loginButton.addTarget(self, action: #selector(self.loginViaFacebook), for: .touchUpInside)

        // Adds it to screen
        self.view.addSubview(loginButton)
    }
    
    // Adds facebook login function
    func loginViaFacebook() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success( _, _, let accessToken):
                print("Logged in!")
                loginHandler.grabUserData(accessToken: accessToken.authenticationToken)
            }
        }
    }

}

