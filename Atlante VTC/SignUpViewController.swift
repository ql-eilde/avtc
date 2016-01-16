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
    
    var buttonTitlePressed: String?
    var isSignIn: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if buttonTitlePressed != nil {
            if buttonTitlePressed == "signIn" {
                isSignIn = true
                print(buttonTitlePressed)
                print(isSignIn)
            }
        }
        else {
            isSignIn = false
            print("Register")
        }
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
