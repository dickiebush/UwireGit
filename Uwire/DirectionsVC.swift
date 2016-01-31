//
//  DirectionsVC.swift
//  Uwire
//
//  Created by Richard Bush on 6/21/15.
//  Copyright © 2015 Richard Bush. All rights reserved.
//

import UIKit

class DirectionsVC: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var one: UITextView!
    
    @IBOutlet weak var two: UITextView!
    
    @IBOutlet weak var three: UITextView!
    
    @IBOutlet weak var logo: UIImageView!
    

    @IBAction func upSwiped(sender: AnyObject) {
        performSegueWithIdentifier("back", sender: self)
    }
    
 
    
    override func viewDidLoad()
    {
     
        
        logo.image = UIImage(named: "3D Uwire-1")
    
        
        one.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        two.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        three.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        
        
        self.view.backgroundColor = UIColor(red: 140.0/255.0, green: 140.0/255.0, blue: 140.0/255.0, alpha: 1.0)
        
      
        one.font = UIFont(name: "Verdana", size: 19)
        
        two.font = UIFont(name: "Verdana", size: 19)
        
        three.font = UIFont(name: "Verdana", size: 19)
        
        
    }
    

}