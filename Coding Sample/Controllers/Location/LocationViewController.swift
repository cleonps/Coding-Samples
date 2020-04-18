//
//  LocationViewController.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 06/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    private var isLocating = false
    
    @IBOutlet var locateButton: UIButton!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var horizontalAccuracyLabel: UILabel!
    @IBOutlet var verticalAccuracyLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var speedAccuracyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        locateButton.layer.cornerRadius = 15
        locateButton.layer.masksToBounds = true
    }
    
    @IBAction func startLocating(_ sender: UIButton) {
        if isLocating {
            locationManager.stopUpdatingLocation()
        } else {
            locationManager.startUpdatingLocation()
        }
        toggleData()
        isLocating.toggle()
    }
    
    private func toggleData() {
        let buttonTitle = isLocating ? "Geolocalizar" : "Detener"
        locateButton.setTitle(buttonTitle, for: .normal)
        
        latitudeLabel.isHidden.toggle()
        longitudeLabel.isHidden.toggle()
        altitudeLabel.isHidden.toggle()
        horizontalAccuracyLabel.isHidden.toggle()
        verticalAccuracyLabel.isHidden.toggle()
        courseLabel.isHidden.toggle()
        speedLabel.isHidden.toggle()
        speedAccuracyLabel.isHidden.toggle()
    }
}

extension LocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        
        latitudeLabel.text = "Latitud: \(Float32(location.coordinate.latitude))"
        longitudeLabel.text = "Longitud: \(Float32(location.coordinate.longitude))"
        altitudeLabel.text = "Altitud: \(Float32(location.altitude))"
        
        horizontalAccuracyLabel.text = "Precisión Horizontal: \(Float32(location.horizontalAccuracy))"
        verticalAccuracyLabel.text = "Precisión Vertical: \(Float32(location.verticalAccuracy))"
        
        let direction = location.course == -1 ? "Sin dirección" : "\(location.course)"
        courseLabel.text = "Dirección \(direction)"
        let speed = location.speed == -1 ? "Sin movimiento" : "\(location.speed)"
        speedLabel.text = "Velocidad: \(speed)"
        let speedAccuracy = location.speedAccuracy == -1 ? "Sin movimiento" : "\(location.speedAccuracy)"
        speedAccuracyLabel.text = "Precisión de Velocidad: \(speedAccuracy)"
    }
}
