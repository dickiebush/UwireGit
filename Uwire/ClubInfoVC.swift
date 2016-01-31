//
//  ClubInfoViewController.swift
//  Uwire
//
//  Created by Richard Bush on 6/14/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import UIKit
import MapKit
import Parse
import Bolts
import Foundation

class ClubInfoVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageToPresent: UIImageView!
    
    @IBOutlet weak var fullNameText: UILabel!
    
    
    var clubToPresent : EatingClub? = nil
    
    var leftData : [String] = ["Time Open", "Theme", "Entry Type", "Live Music?", "Swipe right to return to map"]
    
    var rightData : [String] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let query = PFQuery(className: "EatingClub")
        
        query.whereKey("title", equalTo: clubToPresent!.title!)
        
        let newClub = query.getFirstObject()
        
        let timeOpen  = newClub?["timeOpen"]  as! String
        let themeType = newClub?["themeType"] as! String
        let entryType = newClub?["entryType"] as! String
        let musicType = newClub?["musicType"] as! String
        
        
        rightData = [timeOpen, themeType, entryType, musicType, ""]
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        fullNameText.text = clubToPresent?.fullName
        
        imageToPresent.image = clubToPresent?.image
        
        self.tableView.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        
        self.tableView.separatorColor = UIColor.whiteColor()
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let dequeue: AnyObject = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        let cell = dequeue as! CustomTableViewCell
        
        cell.leftSide.text = leftData[indexPath.row]
        cell.rightSide.text = rightData[indexPath.row]
        
        
        cell.backgroundColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        return 55
    }
    
    override func viewDidAppear(animated: Bool)
    {
        
        self.tableView.flashScrollIndicators()
    }
    
}


  

