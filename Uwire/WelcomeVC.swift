//
//  WelcomeVC.swift
//  Uwire
//
//  Created by Richard Bush on 6/21/15.
//  Copyright © 2015 Richard Bush. All rights reserved.
//

import UIKit
import Parse
import Bolts

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var getPluggedIn: UIButton!
    
    @IBOutlet weak var welcomeText: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var moreInfoButton: UIButton!
    
    @IBOutlet weak var shareSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var firstTimeSpinner: UIActivityIndicatorView!
   
    var name : String? 
    
    // return to map from more info screen
    @IBAction func returnToWelcome(segue: UIStoryboardSegue)
    {
        
    }
    @IBAction func moreInfoPressed(sender: AnyObject)
    {
  
        firstTimeSpinner.startAnimating()
    }
    
    
    @IBOutlet weak var moreInfoPressed: UIButton!
    
    @IBAction func sharePressed(sender: AnyObject)
    {
        
        shareSpinner.startAnimating()
        
        let firstActivityItem = "Princeton's Eating Club app               "
        let secondActivityItem = "itms://itunes.com/apps/uwireprinceton"
     
        let arr = [firstActivityItem, secondActivityItem]
    
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: arr, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, UIActivityTypeMail]
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
        shareSpinner.stopAnimating()
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        
        logo.image = UIImage(named: "3D Uwire-1")
        
        self.navigationController?.navigationBarHidden = true
        
        
        // design getPluggedIn button
        getPluggedIn.layer.cornerRadius = 10
        getPluggedIn.layer.borderWidth = 1.3
        getPluggedIn.layer.borderColor = UIColor.whiteColor().CGColor
        getPluggedIn.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        
        // design shareButton button
        shareButton.layer.cornerRadius = 10
        shareButton.layer.borderWidth = 1.3
        shareButton.layer.borderColor = UIColor.whiteColor().CGColor
        shareButton.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        
        moreInfoButton.layer.cornerRadius = 10
        moreInfoButton.layer.borderWidth = 1.3
        moreInfoButton.layer.borderColor = UIColor.whiteColor().CGColor
        moreInfoButton.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        
        
        let user = PFUser.currentUser()
        
      welcomeText.text = "Hello, \(name!)"
        
    }


    @IBAction func getPluggedIn(sender: UIButton)
    {
   
        performSegueWithIdentifier("Get Plugged In", sender: getPluggedIn)
        
    }
}
