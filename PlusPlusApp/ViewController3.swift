//
//  ViewController3.swift
//  PlusPlusApp
//
//  Created by Izzy Rael on 2/15/16.
//  Copyright © 2016 Team PlusPlus. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController3: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManagerDelegate
    //1
    //extension ViewController3: CLLocationManagerDelegate {
        // 2
        func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            // 3
            if status == .AuthorizedWhenInUse {
                
                // 4
                locationManager.startUpdatingLocation()
                
                //5
                mapView.myLocationEnabled = true
                mapView.settings.myLocationButton = true
            }
        }
        
        // 6
        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                
                // 7
                mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
                
                // 8
                locationManager.stopUpdatingLocation()
            }
            
        }
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
//}
