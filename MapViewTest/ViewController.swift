//
//  ViewController.swift
//  MapViewTest
//
//  Created by Robert Wais on 1/27/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var centered = false
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationStatus()
    }
    
    func locationStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }else{
            //get permission
            locationManager.requestWhenInUseAuthorization()
        }
    }

    //CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            mapView.showsUserLocation = true
        }
    }
    
    func centerMap(location: CLLocation){
        let place = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000,200)
        mapView.setRegion(place, animated: true)
    }
    
    //if gps changes update view
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if let location = userLocation.location{
                centerMap(location: location)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPressed(_ sender: Any) {
    }
    
}

