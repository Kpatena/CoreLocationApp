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
    
    @IBOutlet weak var currentLat: UILabel!
    @IBOutlet weak var currentLong: UILabel!
    @IBOutlet weak var scienceWorldLat: UILabel!
    
    @IBOutlet weak var scienceWorldLong: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    var startLocation:CLLocation?
    let endLocation = CLLocation(latitude: 49.273431, longitude: -123.103857)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        //manager.requestLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            startLocation = location
            currentLat.text = String(location.coordinate.latitude)
            currentLong.text = String(location.coordinate.longitude)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getDistance() {
        let distanceInMeters = startLocation!.distanceFromLocation(endLocation)
        let distanceInKM = distanceInMeters / 1000
        
        distance.text = String(distanceInKM) + " KM"
        
    }
    //func distanceInMetersFrom(otherCoord : CLLocationCoordinate2D) -> CLLocationDistance {
        //let firstLoc = CLLocation(latitude:  , longitude: self.longitude)
        //let secondLoc = CLLocation(latitude: otherCoord.latitude, longitude: otherCoord.longitude)
        //return firstLoc.distanceFromLocation(secondLoc)
    //}


}

