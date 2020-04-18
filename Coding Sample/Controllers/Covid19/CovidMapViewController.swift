//
//  CovidMapViewController.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 08/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class CovidMapViewController: UIViewController {
    private var worldData = [CountryData]()
    
    @IBOutlet var covidMapView: MKMapView!
    
    override func viewDidLoad() {
        covidMapView.delegate = self
        networkCall()
    }
    
    private func networkCall() {
        let endpoint = "https://corona.lmao.ninja/v2/countries?sort=country"
        let url = URL(string: endpoint)!
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                do {
                    guard let data = response.data else { return }
                    self.worldData = try JSONDecoder().decode([CountryData].self, from: data)
                    self.presentData()
                } catch {
                    self.presentError()
                }
            } else {
                self.presentError()
            }
        }
    }
    
    private func presentError() {
        let alert = UIAlertController(title: "Error", message: "Error al intentar obtener los datos. Por favor, intente más tarde.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func presentData() {
        var annotations = [MKPointAnnotation]()
        
        for data in worldData {
            let latitude = Double(data.countryInfo.lat)
            let longitude = Double(data.countryInfo.long)
            let annotation = MKPointAnnotation()
            let centerCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.coordinate = centerCoordinate
            annotation.title = "\(data.country)"
            annotations.append(annotation)
        }
        
        covidMapView.addAnnotations(annotations)
        covidMapView.mapType = .satellite
        covidMapView.showsCompass = true
    }
    
}

extension CovidMapViewController : MKMapViewDelegate, CLLocationManagerDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        var country: CountryData?
        mapView.deselectAnnotation(view.annotation, animated: true)
        
        for countryData in worldData {
            if view.annotation?.title == countryData.country {
                country = countryData
                break
            }
        }
        
        let viewController = instantiateVC(storyboard: .covid, identifier: .covidDetail, controller: CovidDetailViewController.self, presentation: .overCurrentContext)
        viewController.countryData = country
        self.present(viewController, animated: true)
        
    }
}

class MapPoint: MKPointAnnotation {
    var image: UIImage?
    
    override init() {
        super.init()
    }
}
