//
//  EatingClubModel.swift
//  Uwire
//
//  Created by Richard Bush on 6/11/15.
//  Copyright (c) 2015 Richard Bush. All rights reserved.
//

import Foundation
import MapKit

class EatingClubModel
{

    
    
static func returnClubs() ->  [EatingClub]
    {
        
        var cannonClub = EatingClub(title: "Cannon", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.347779, -74.653357), image: UIImage(named: "cannon"), fullName : "Cannon Dial Elm Club", icon: UIImage(named: "cannonIcon"))
        
        var cottageClub = EatingClub(title: "Cottage", subtitle: nil, coordinate: CLLocationCoordinate2D(latitude: 40.348210, longitude: -74.651719), image: UIImage(named: "cottage"), fullName : "University Cottage Club", icon: UIImage(named: "cottageIcon"))
        
        var capnGownClub = EatingClub(title: "Cap and Gown", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.348323, -74.651054), image: UIImage(named: "cap"), fullName : "Cap and Gown Club", icon: UIImage(named: "capIcon"))
        
        var cloisterClub = EatingClub(title: "Cloister", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.348581, -74.650557), image: UIImage(named: "cloister"), fullName : "Cloister Inn", icon: UIImage(named: "cloisterIcon"))
        
        var tigerInn = EatingClub(title: "Tiger Inn", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.348979, -74.652243), image: UIImage(named: "tigerinn"), fullName : "The Tiger Inn", icon: UIImage(named: "tigerInnIcon"))
        
        var towerClub = EatingClub(title: "Tower", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.347687, -74.653929), image: UIImage(named: "tower"), fullName : "Princeton Tower Club", icon: UIImage(named: "towerIcon"))
        
        var quadClub = EatingClub(title: "Quadrangle", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.348018, -74.652736), image: UIImage(named: "quad"), fullName : "Princeton Quadrangle Club", icon: UIImage(named: "quadIcon"))
        
        var colonialClub = EatingClub(title: "Colonial", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.348857, -74.652816), image: UIImage(named: "colonial"), fullName : "The Colonial Club", icon: UIImage(named: "colonialIcon"))
        
        var ivyClub = EatingClub(title: "Ivy", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.348123, -74.652225), image: UIImage(named: "ivy"), fullName : "The Ivy Club", icon: UIImage(named: "ivyIcon"))
        
        var terraceClub = EatingClub(title: "Terrace", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.347164, -74.653889), image: UIImage(named: "terrace"), fullName : "Terrace F. Club", icon: UIImage(named: "terraceIcon"))
        
        var charterClub = EatingClub(title: "Charter", subtitle: nil, coordinate: CLLocationCoordinate2DMake(40.348779, -74.649994), image: UIImage(named: "charter"), fullName : "Princeton Charter Club", icon: UIImage(named: "charterIcon"))
        
        return [cannonClub, cottageClub, capnGownClub, cloisterClub, tigerInn, towerClub, quadClub, colonialClub, ivyClub, terraceClub, charterClub]
    }
    
}