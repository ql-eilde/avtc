//
//  SignUpViewController.swift
//  Atlante VTC
//
//  Created by Quentin L'EILDE on 1/16/16.
//  Copyright © 2016 Quentin L'EILDE. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var riderDriverControl: UISegmentedControl!
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
