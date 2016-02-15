
//
//  MapViewController.swift
//  PlusPlusApp
//
//  Created by Izzy Rael on 2/15/16.
//  Copyright © 2016 Team PlusPlus. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    @IBOutlet var mapView: GMSMapView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let camera = GMSCameraPosition.cameraWithLatitude(40.7127,
            longitude: -74.0059, zoom: 6)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        //self.navigationController?.navigationBar.addSubview(mapView)

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(40.7127, -74.0059)
        marker.title = "New York"
        marker.snippet = "New York"
        marker.map = mapView

        //self.view.insertSubview(self.mapToolbar, aboveSubview: self.mapView)
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}


