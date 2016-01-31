//
//  MoreInfoVC.swift
//  Uwire
//
//  Created by Richard Bush on 7/11/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import UIKit
import Foundation
import Parse
import Bolts

class MoreInfoVC: UIViewController {

    
    // information text view
    @IBOutlet weak var infoText: UITextView!
        {
        didSet
        {
            
            let query = PFQuery(className: "ExtraInfo")
            
            let result = query.getFirstObject()
            
            infoText.text = result!["info"] as! String

            infoText.textColor = UIColor.whiteColor()
            
            infoText.font = UIFont(name: "Verdana", size: 21.0)
            
            infoText.scrollRangeToVisible(NSRange(location: 0,length: 0))
            
            infoText.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
            
            infoText.textAlignment = .Center
            
        }
    }
    
    // logout button
    @IBOutlet weak var logoutButton: UIButton!
        {
        
            didSet
            {
                
            
            logoutButton.layer.cornerRadius = 10
            logoutButton.layer.borderWidth = 1.3
            logoutButton.layer.borderColor = UIColor.whiteColor().CGColor
            logoutButton.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
            
            }
    }
    
    // Uwire logo
    @IBOutlet weak var logo: UIImageView!
    {
        didSet
        {
            logo.image = UIImage(named: "3D Uwire-1")
        }
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
      
    }
    
    // let the user know its scrollable
    override func viewDidAppear(animated: Bool) {
    
        self.infoText.flashScrollIndicators()
        
        
    }
    
    // user wants to logout 
    @IBAction func logOutPressed(sender: AnyObject)
    {
        PFUser.logOut()
        
        performSegueWithIdentifier("return to entry", sender: nil)
    }
    

}
