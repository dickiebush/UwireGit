//  GPXViewController.swift
//  Uwire
//
//  Created by Richard Bush on 6/10/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import UIKit
import MapKit
import Parse
import Bolts


class MapVC: UIViewController, MKMapViewDelegate
{
    
    var seenDirections : Bool?                  // show the directions or not
    var user = PFUser.currentUser()             // current user of the app
    var clubs = EatingClubModel.returnClubs()   // list of eating clubs
    
    @IBOutlet weak var directions: UIButton!
    
    
    override func viewDidLoad()
    {
                super.viewDidLoad()
        
        // add all of the annotations
        mapView.addAnnotations(self.clubs)
    
        // hide the nav bar
        self.navigationController?.navigationBarHidden = true
        
        // fetch whether or not to show the user the directions
        seenDirections = self.user?["seenDirections"] as? Bool
        
        // add the swipe gesture to show the directions
        let swipe = UISwipeGestureRecognizer(target: self, action: "showDirections")
        swipe.enabled = true
        swipe.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipe)
        
        
        // design the show directions button
        directions.backgroundColor = UIColor(red: 255/255.0, green: 145/255.0, blue: 23/255.0, alpha: 1.0)
        directions.hidden = true
        directions.layer.cornerRadius = 9
        directions.layer.borderWidth = 1.3
        directions.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    // show the directions screen if its the users first time
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        
        if (!seenDirections!)
        {
            
            user?["seenDirections"] = true
            user?.save()
            
            
            seenDirections = true
            
            performSegueWithIdentifier("Show Directions", sender: self)
            
        }
    }
    
    
    // show the user the directions
    func showDirections()
    {
        performSegueWithIdentifier("Show Directions", sender: self)
    }
    
    
    
    // creates the AnnotationView for each annotation (viewForAnnotation)
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?
    {
        // hand information with the club
        let club = annotation as! EatingClub
        
        let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        
        let query = PFQuery(className: "EatingClub")
        
        query.whereKey("title", equalTo: club.title!)
        
        var newClub : PFObject? = nil
        
        query.getFirstObjectInBackgroundWithBlock { (object: PFObject?, error: NSError?) -> Void in
           
            newClub = object
            
            let isOpen = newClub?["isOpenTonight"] as? Bool
            
            // if the club is open, assemble the annotation view
            if (isOpen!)
            {
                
                club.subtitle = nil
                
                view.image = UIImage(named: "beerIcon")
                
                view.canShowCallout = true
                
                view.leftCalloutAccessoryView = UIImageView(frame: CGRect(x: 0,y: 0,width: 63,height: 63))
                
                
                view.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.System) as? UIButton
                
                view.rightCalloutAccessoryView?.frame = CGRectMake(40, 40, 40, 40)
                
            }
                // if it isn't open, set the image as an X and disable the Callout
            else
            {
                club.subtitle = "Closed Tonight"
                
                view.canShowCallout = true
                
                view.image = UIImage(named: "xIcon")
                
                view.leftCalloutAccessoryView = nil
            
                view.rightCalloutAccessoryView = nil
                
            }
        }
        
        // assign the annotation to the current view it is working on
        view.annotation = annotation
        
        return view
        
    }
    
    // show the directions button after zooming in
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool)
    {
        if (animated) { directions.hidden = false }
    }
    
    
    // set the camera after the view appears
    override func viewDidAppear(animated: Bool)
    {
        let center = CLLocationCoordinate2D(latitude: 40.348618, longitude: -74.652015)
        
        let eyeView = CLLocationCoordinate2D(latitude: 40.346067, longitude: -74.663311)
        
        let camera = MKMapCamera(lookingAtCenterCoordinate: center, fromEyeCoordinate: eyeView, eyeAltitude: 0.0 )
        
        mapView.setCamera(camera, animated: true)
        
    
    }
    
    
    // when the Annotation is selected, configure the annotation
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView)
    {
        let imageView = view.leftCalloutAccessoryView as? UIImageView
        
        let club = view.annotation as? EatingClub
        
        // load the image into the leftAccessory
        imageView?.image = club!.image
        
        // assemble the right button
        let rightButton = view.rightCalloutAccessoryView as? UIButton
        
        rightButton?.setBackgroundImage(club?.icon, forState: UIControlState.Normal)
        
     
        
    }
    
    
    // segue when the button on the callout is tapped
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        performSegueWithIdentifier("Show Club Info", sender: view)
    }
    
    
    
    
    // prepare data for next view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Show Club Info"
        {
            if let club = (sender as? MKAnnotationView)!.annotation as? EatingClub
            {
                if let dest = segue.destinationViewController as? ClubInfoVC
                {
                    dest.clubToPresent = club
                }
                
                
                
            }
        }
    }
    
    // create the MapView
    @IBOutlet weak var mapView: MKMapView!
        {
        
        didSet
        {
            
            mapView.mapType = .Hybrid
            
            mapView.delegate = self
            
            mapView.scrollEnabled = false
            
            mapView.zoomEnabled = false
            
       
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.887, longitude: -95.47095), span: MKCoordinateSpan(latitudeDelta: 20.602, longitudeDelta: 57.5241))
            
            mapView.setRegion(region, animated: false)
        
        }
        
    }

    // segue to unwind
    @IBAction func returnToMap(segue: UIStoryboardSegue)
    {
        
    }
   
}