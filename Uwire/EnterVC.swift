//
//  EnterVC.swift
//  Uwire
//
//  Created by Richard Bush on 8/20/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import UIKit
import Parse
import Bolts

class EnterVC: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var fullNameTxt: UITextField!
        {
        didSet
        {
            fullNameTxt.delegate = self;
        }
    }
    @IBOutlet weak var netIDtxt: UITextField!
        {
        didSet
        {
            netIDtxt.delegate = self;
        }
    }
    
    @IBOutlet weak var getStartedButton: UIButton!
        {
        didSet
        {
            getStartedButton.layer.cornerRadius = 8
            getStartedButton.layer.borderWidth = 1.3
            getStartedButton.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    
    var firstTime : Bool = true                 // keep track of user directions
    
    
    override func viewDidLoad()
    {
  
        
        if let _ = PFUser.currentUser()
        {
            // go to the map
            performSegueWithIdentifier("sign up successful", sender: self)
            
        }
        else
        {
            
            self.view.hidden = false
            
            firstTime = false
        }
        
        spinner.hidden = true
    }
    
    // if there is a user logged in, skip the login screens
    override func viewDidAppear(animated: Bool)
    {
        if PFUser.currentUser() != nil
        {
            // go to the map
            self.performSegueWithIdentifier("sign up successful", sender: self)
            
        }
        else
        {
            self.view.hidden = false
            
            firstTime = false
        }
        
    }
    
    // if the user hasn't made an account, show this screen
    override func viewWillAppear(animated: Bool)
    {
        if firstTime
        {
            self.view.hidden = true
        }
    }
    
    // end editing if user touches outside textfield
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == fullNameTxt
        {
            netIDtxt.becomeFirstResponder()
        }
        else
        {
            self.view.endEditing(true)
            getStarted(getStartedButton)
        }
        
        return true
    }
    
    @IBAction func getStarted(sender: UIButton)
    {
        self.view.endEditing(true)
        
        spinner.hidden = false
        
        if checkFullName(fullNameTxt.text) && checkNetID(netIDtxt.text)
        {
            
            let User = PFUser()
            
            User.username = netIDtxt.text
            User.password = " "
            User["fullName"] = fullNameTxt.text
            User["seenDirections"] = false
            
            User.signUpInBackground()
            
            PFUser.logInWithUsernameInBackground(netIDtxt.text, password: " ")
            
          
            performSegueWithIdentifier("sign up successful", sender: self)
            
        }
        
        
    }
    
    // checks to see the entered username is valid
    private func checkFullName(fullName: String) -> Bool
    {
        // field is filled in
        if fullName == ""
        {
            self.presentViewController(ErrorHelper.showError("All fields must be complete"), animated: true, completion: nil)
            
            spinner.hidden = true
            
            return false
            
        }
        
        // made it through
        return true
    }
    
    private func checkNetID(netID: String) -> Bool
    {
        let query = PFQuery(className: "netIDsDatabase")
        
        query.whereKey("netID", equalTo: netID)
        
        let result = query.getFirstObject()
        
        if netID == ""
        {
            self.presentViewController(ErrorHelper.showError("All fields must be complete"), animated: true, completion: nil)
            
            spinner.hidden = true
            
            return false
        }
        
        if result == nil
        {
            self.presentViewController(ErrorHelper.showError("Please enter a valid netID"), animated: true, completion: nil)

            spinner.hidden = true
            
            return false
        }
        
    
        
        
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "sign up successful"
        {
            if let dest = segue.destinationViewController as? WelcomeVC
            {
                let fullNameArr = fullNameTxt.text.componentsSeparatedByString(" ")
               
                dest.name = fullNameArr[0]
                
            }
        
        }
    }
}
