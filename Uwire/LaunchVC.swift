//
//  LaunchVC.swift
//  Uwire
//
//  Created by Richard Bush on 6/20/15.
//  Copyright © 2015 Richard Bush. All rights reserved.
//

import UIKit
import Foundation

class LaunchVC: UIViewController  {

    let time : NSTimeInterval = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor(red: 0.96, green: 0.61, blue: 0.09, alpha: 1.0)
        
        performSelector(advance(), withObject: nil, afterDelay: time)
        
        
    }

    override func performSelector(aSelector: Selector, withObject anArgument: AnyObject?, afterDelay delay: NSTimeInterval) {
        //
    }
        
    
    

    func advance()
    {
        performSegueWithIdentifier("Continue", sender: nil)
    }
}
