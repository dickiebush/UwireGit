//
//  EatingClub.swift
//  Uwire
//
//  Created by Richard Bush on 6/10/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import Foundation
import MapKit

class EatingClub: NSObject, MKAnnotation
{
    
    var title : String?
    var subtitle : String?
    var coordinate : CLLocationCoordinate2D
    var image : UIImage?
    var fullName : String?
    var icon : UIImage?
    
    
    init(title : String?, subtitle : String?, coordinate : CLLocationCoordinate2D, image : UIImage?, fullName: String?, icon : UIImage?)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.image = image
        self.fullName = fullName
        self.icon = icon
        
    }
    

}


