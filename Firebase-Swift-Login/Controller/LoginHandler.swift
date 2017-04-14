//
//  LoginHandler.swift
//  Firebase-Swift-Login
//
//  Created by Michael Ding on 2017-04-14.
//  Copyright © 2017 Michael Ding. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin
import Firebase

// Controller for grabbing and saving user data
class LoginHandler {
    
    init() {
        
    }
    
    // Grabs user data from facebook
    public func grabUserData(accessToken: String) {
        let connection = GraphRequestConnection()
        let params = ["fields":"id,name"]
        connection.add(GraphRequest(graphPath: "/me", parameters: params, accessToken: AccessToken.current, httpMethod: .GET, apiVersion: .defaultVersion)) { httpResponse, result in
            switch result {
            case .success(let response):
                print("Graph Request Succeeded: \(response)")
                let userData:[String:Any]? = response.dictionaryValue
                self.storeUserData(userData: userData!)
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
        }
        connection.start()
    }
    
    // Saves user data to currUser model class and Firebase
    public func storeUserData(userData:[String:Any]) {
        // Checks to see if valid data
        guard userData["id"] != nil, let userID = userData["id"] as? String, !userID.isEmpty else {
            print("User id is not there")
            return
        }
        
        guard userData["name"] != nil, let userName = userData["name"] as? String, !userName.isEmpty else {
            print("Name not available")
            return
        }
        
        // Stores data locally in currUser
        currUser.userID = userID
        currUser.name = userName
        
        // Store data into Firebase
        let ref = FIRDatabase.database().reference().child("users").child(userID)
        ref.setValue(userName)
    }
}
var loginHandler:LoginHandler = LoginHandler()
