//
//  ConnectionViewController.swift
//  Kinder-iOS
//
//  Created by Mac portable b_can on 15/03/2015.
//  Copyright (c) 2015 Niv-Babs. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var facebookButton: FBSDKLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Test
        if (FBSDKAccessToken.currentAccessToken() != nil){
            // User is already logged in, do work such as go to next view controller.
            NSLog("Already connected to Facebook")
        }else{
            facebookButton.readPermissions = ["public_profile", "email", "user_friends"]
            facebookButton.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK : Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        
        if ((error) != nil){
            // Process error
            NSLog("Error : \(error)")

        }else if result.isCancelled {
            // Handle cancellations
            NSLog("Cancelled")
        }else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            //if result.grantedPermissions.containsObject("email"){
                // Do work
                returnUserData()
            //}
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil){
                // Process error
                println("Error: \(error)")
            }else{
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                println("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                println("User Email is: \(userEmail)")
            }
        })
    }

}

