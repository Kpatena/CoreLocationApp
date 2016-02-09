//
//  ViewController.swift
//  ToScienceWorld
//
//  Created by Kamil Patena on 2016-02-09.
//  Copyright © 2016 COMP4977iPhoneTeam. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var theMap: MKMapView!
    
    @IBOutlet weak var theLabel: UILabel!
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    var startLocation:CLLocation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        manager.requestLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //func distanceInMetersFrom(otherCoord : CLLocationCoordinate2D) -> CLLocationDistance {
        //let firstLoc = CLLocation(latitude:  , longitude: self.longitude)
        //let secondLoc = CLLocation(latitude: otherCoord.latitude, longitude: otherCoord.longitude)
        //return firstLoc.distanceFromLocation(secondLoc)
    //}


}

