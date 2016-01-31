//
//  LoginViewController.swift
//  Uwire
//
//  Created by Richard Bush on 6/12/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//


import Foundation
import CoreData
import UIKit
import Parse
import Bolts


class LoginVC: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var logo: UIImageView!        // logo
    
    @IBOutlet weak var usernameTxt: UITextField! // username
        {
        didSet
        {
            usernameTxt.delegate = self
        }
    }
    @IBOutlet weak var passwordTxt: UITextField! // password
        {
        didSet
        {
            passwordTxt.delegate = self
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var leftButton: UIBarButtonItem!

    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var loginSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        
        loginSpinner.startAnimating()
        loginSpinner.hidden = true
        
       
        // set colors
        self.view.backgroundColor = UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        
        // design navigation bar
        navBar.translucent = false
        navBar.barTintColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        
        // set accessory color
        topView.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
      
        
        // design login button
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1.3
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        loginButton.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        
        // set the logo
        logo.image = UIImage(named: "3D Uwire-1")
        
    }
  
    
    // end editing if user touches outside textfield
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
        
        view.endEditing(true)
    }
    
    // dismiss keyboard first
    override func viewWillDisappear(animated: Bool) {
        
        view.endEditing(true)
        
    }
    
    // open the keyboard
    override func viewDidAppear(animated: Bool) {
    
        usernameTxt.becomeFirstResponder()
    }
    
    // move to the next text fields as you hit next
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField === usernameTxt
        {
            passwordTxt.becomeFirstResponder()
            return true
        }
        if textField === passwordTxt
        {
            passwordTxt.resignFirstResponder()
            loginPressed(passwordTxt)
            return true
        }
        return true
    }
    
    // user tries to login
    @IBAction func loginPressed(sender: AnyObject)
    {
       
        loginSpinner.hidden = false
        
        let password = passwordTxt.text
        let username = usernameTxt.text
        
        // empty textfields
        if password == "" || username == ""
        {
            self.presentViewController(ErrorHelper.showError("All fields must be complete"), animated: true, completion: nil)
            
            self.loginSpinner.hidden = true
        }
    
        PFUser.logInWithUsernameInBackground(username!, password: password!) {
            (user: PFUser?, error: NSError?) -> Void in
           
            if user != nil
            {
                // proceed to app
                self.performSegueWithIdentifier("Login Successful", sender: self.loginButton)
                
                
            }
            else
            {
              
                self.loginSpinner.hidden = true
                
                self.presentViewController(ErrorHelper.showError("Email or Password is incorrect"), animated: true, completion: nil)
                
            }
        }
 
       
    }
}