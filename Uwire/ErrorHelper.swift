//
//  ErrorHelper.swift
//  Uwire
//
//  Created by Richard Bush on 7/2/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import Foundation
import UIKit



public class ErrorHelper
{

    static func showError(errormsg : String) -> UIViewController
    {
        let alertController = UIAlertController(title: errormsg, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        return alertController
        
    }
}