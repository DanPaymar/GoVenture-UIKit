//
//  ViewController.swift
//  GoVenture
//
//  Created by Daniel Paymar on 5/31/24.
//

import UIKit
import MapboxMaps

class MapVC: UIViewController {
    
    private var mapView: MapView!

    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        // Set initial camera settings
                let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 37.26301831966747, longitude: -121.97647612483807), zoom: 10)
        let options = MapInitOptions(cameraOptions: cameraOptions, styleURI: .outdoors)

                mapView = MapView(frame: view.bounds, mapInitOptions: options)
                mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                view.addSubview(mapView)
    }
}
