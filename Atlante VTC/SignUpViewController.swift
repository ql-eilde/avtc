//
//  SignUpViewController.swift
//  Atlante VTC
//
//  Created by Quentin L'EILDE on 1/16/16.
//  Copyright © 2016 Quentin L'EILDE. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var riderDriverControl: UISegmentedControl!
    @IBOutlet weak var email: UITextField!
    
    var buttonTitlePressed: String?
    var isSignIn: Bool!
    var isRider: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.determineSignInOrRegister()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func done(sender: UIBarButtonItem) {

        if isSignIn == false {
            //Register the user
            
            if self.username.text == "" || self.password.text == "" || self.email.text == "" || self.riderDriverControl.selectedSegmentIndex == -1 {
                if self.username.text == "" {
                    self.username.layer.borderColor = UIColor.redColor().CGColor
                    self.username.layer.borderWidth = 1.0
                }
                if self.password.text == "" {
                    self.password.layer.borderColor = UIColor.redColor().CGColor
                    self.password.layer.borderWidth = 1.0
                }
                if self.email.text == "" {
                    self.email.layer.borderColor = UIColor.redColor().CGColor
                    self.email.layer.borderWidth = 1.0
                }
                if self.riderDriverControl.selectedSegmentIndex == -1 {
                    self.riderDriverControl.layer.borderColor = UIColor.redColor().CGColor
                    self.riderDriverControl.layer.borderWidth = 1.0
                    
                    self.showAlert("Missing Field Required", message: "Fill in or select missing Field(s) in red")
                }
            }
            else {
                var user = PFUser()
                
                user.username = self.username.text
                user.password = self.password.text
                user.email = self.email.text
                
                user["isRider"] = self.isRider
                
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if let error = error {
                        let errorString = error.userInfo["error"] as? NSString
                        self.showAlert("Error Registering", message: String(errorString))
                    }
                    else {
                        print("Register Succeeded")
                    }
                }
            }
            
        }
        else {
            //Sign in code
            PFUser.logInWithUsernameInBackground(self.username.text!, password: self.password.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    // Do stuff after successful login.
                    print("Login Successful")
                } else {
                    // The login failed. Check error to see why.
                    if let errorInfo = error?.userInfo["error"] as? String {
                        self.showAlert("Sign Up Failed", message: errorInfo)
                    }
                }
            }
        }
    }

    
    func determineSignInOrRegister(){
        
        if buttonTitlePressed != nil {
            if buttonTitlePressed == "signIn" {
                isSignIn = true
                self.navigationController!.topViewController!.title = "Sign In"
                
                print("SignIn")
            }
        }
        else {
            isSignIn = false
            self.navigationController!.topViewController!.title = "Register"
            self.riderDriverControl.hidden = false
            self.email.hidden = false
            
            print("Register")
        }
    }
    
    @IBAction func riderDriver(sender: UISegmentedControl) {
        
        if self.riderDriverControl.selectedSegmentIndex == 0 {
            self.isRider = true
            print("I'm a rider")
        }
        else {
            self.isRider = false
            print("I'm a driver")
        }
    }
    
    func showAlert(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
