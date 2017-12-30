//
//  MapViewController.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 28/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MVCMapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var geoposition: Location!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.title = "Map view"

        mapView.delegate = self
        mapView.mapType = MKMapType.standard

        let location = CLLocationCoordinate2D(latitude: Double(geoposition.lat)!,
                                              longitude: Double(geoposition.lng)!)

        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Position"
        annotation.subtitle = String("Subtitle")
        mapView.addAnnotation(annotation)
    }
}
