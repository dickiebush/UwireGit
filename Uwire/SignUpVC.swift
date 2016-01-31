//
//  ViewController.swift
//  Uwire
//
//  Created by Richard Bush on 6/9/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import UIKit
import MapKit
import CoreData
import Parse
import Bolts



class SignUpVC: UIViewController, UITextFieldDelegate
{
    
    
    @IBOutlet weak var usernameTxt: UITextField! // email textfield
    {
        didSet
        {
            usernameTxt.delegate = self
        }
    }
    
    @IBOutlet weak var passwordTxt: UITextField! // password textfield
    {
        didSet
        {
            passwordTxt.delegate = self
        }
    }

    @IBOutlet weak var fullNameTxt: UITextField! // name textfield
    {
        didSet
        {
            fullNameTxt.delegate = self
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var signUpButton: UIButton! // signup button
    
    @IBOutlet weak var navBar: UINavigationBar! // navigation bar
    
    @IBOutlet weak var topBar: UIView! // accessory color bar
    
    @IBOutlet weak var leftButton: UIBarButtonItem! // navbar button
    
    @IBOutlet weak var loginButton: UIButton! // login button
    
    @IBOutlet weak var rightBuffer: UIView! // positional buffer
    
    @IBOutlet weak var leftBuffer: UIView! /// possitional buffer
    
    @IBOutlet weak var logo: UIImageView! // logo
    
    
    
    // dismiss the keyboard before the view segues
    override func viewWillDisappear(animated: Bool)
    {
        self.view.endEditing(true)
    }
    
    // end editing if user touches outside the text fieds
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
        self.view.endEditing(true)
    }

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        
        // design navBar and top bar accessory
        navBar.translucent = false
        navBar.barTintColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        topBar.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        
        // design positioning buffers
        rightBuffer.backgroundColor = UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        leftBuffer.backgroundColor = UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        
        // design signUpButton
        signUpButton.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1.3
        signUpButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        // design loginButton
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1.3
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        loginButton.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        
        // set the logo
        logo.image = UIImage(named: "3D Uwire-1")
     
    }
    
   
    
    // pull up keyboard once view has loaded
    override func viewDidAppear(animated: Bool)
    {
        fullNameTxt.becomeFirstResponder()
    }
    
    
    
    // transition between signUp textFields with the return key
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        if textField == fullNameTxt
        {
           usernameTxt.becomeFirstResponder()
           return true
        }
        else if textField == usernameTxt
        {
        
            passwordTxt.becomeFirstResponder()
            return true
        }
        else if textField == passwordTxt
        {
            self.view.endEditing(true)
        
            signUpPressed(signUpButton)
            
        }
        
        return true
    }
    
    
    
    // save signUp data
    @IBAction func signUpPressed(sender: UIButton)
    {
        spinner.startAnimating()

        let username : String? = usernameTxt.text
        let password : String? = passwordTxt.text
        let fullName : String? = fullNameTxt.text
        
        println(username)
        println(password)
        
        // see if the sign up info is valid
        if checkUsername(username!) && checkPassword(password!)
        {
            let User = PFUser()
            
            
            User.username = username
            User.password = password
            User["fullName"] = fullName
            User["seenDirections"] = false
            
            User.signUp()
            
            
            PFUser.logInWithUsername(username!, password: password!)
            
            // proceed to app
            performSegueWithIdentifier("sign up successful", sender: signUpButton)
        
 
        }
        
        
        
      
    }
   
    
    // checks to see the entered username is valid
    func checkUsername(username: String) -> Bool
    {
        var retVal : Bool = true
        
        let username = usernameTxt.text
        
        let query = PFUser.query()
        
        query?.whereKey("username", equalTo: username!)
        
        let result = query?.getFirstObject()
        
        
        // field is filled in
        if username == ""
        {
            
            
            self.presentViewController(ErrorHelper.showError("All fields must be complete"), animated: true, completion: nil)
            
         
            
            return false
         
        }
        
        
        
        // email is already registered
        if (result != nil)
        {
            
            self.presentViewController(ErrorHelper.showError("This NetID is already registered"), animated: true, completion: nil)
            
        
            
            return false
        }
        
       
        // made it through
        return true
    }
    
    func checkPassword(password : String) -> Bool
    {
        var retVal : Bool  = true
        
        // field is filled in
        if password == ""
        {
            retVal = false
            
            self.presentViewController(ErrorHelper.showError("All Fields Must Be Complete"), animated: true, completion: nil)
            
            spinner.stopAnimating()
        }
        
        // atleast 6 characters
        if count(password) < 6
        {
            retVal = false
            
            self.presentViewController(ErrorHelper.showError("Password must be 6 characters or more"), animated: true, completion: nil)
            
            spinner.stopAnimating()
            
        }
        
        return retVal
        
    }

    
}

