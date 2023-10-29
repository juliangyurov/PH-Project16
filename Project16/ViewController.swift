//
//  ViewController.swift
//  Project16
//
//  Created by Yulian Gyuroff on 29.10.23.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "MapType", style: .plain, target: self, action: #selector(chooseMapType))
        
        let sofia = Capital(title: "Sofia", coordinate: CLLocationCoordinate2D(latitude: 42.698334, longitude: 23.319941), info: "Home of the Developer")
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
//        mapView.addAnnotation(london)
//        mapView.addAnnotation(oslo)
//        mapView.addAnnotation(paris)
//        mapView.addAnnotation(rome)
//        mapView.addAnnotation(washington)
        //mapView.mapType = .satellite
        
        mapView.addAnnotations([sofia,london,oslo,paris,rome,washington])
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        annotationView?.pinTintColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = UIColor(red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        }else{
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func chooseMapType() {
        let ac = UIAlertController(title: "Select MapType", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satellite", style: .default,handler: setMapType(action:) ))
        ac.addAction(UIAlertAction(title: "Standart", style: .default,handler: setMapType(action:) ))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default,handler: setMapType(action:) ))
        ac.addAction(UIAlertAction(title: "HybridFlyover", style: .default,handler: setMapType(action:) ))
        ac.addAction(UIAlertAction(title: "SatelliteFlyover", style: .default,handler: setMapType(action:) ))
        present(ac, animated: true)
    }
    @objc func setMapType(action: UIAlertAction) {
        if action.title == "Satellite" {
            mapView.mapType = .satellite
        }else if action.title == "Standart"{
            mapView.mapType = .standard
        }else if action.title == "Hybrid"{
            mapView.mapType = .hybrid
        }else if action.title == "HybridFlyover"{
            mapView.mapType = .hybridFlyover
        }else if action.title == "SatelliteFlyover"{
            mapView.mapType = .satelliteFlyover
        }
        else{
            mapView.mapType = .standard
        }
    }
}

