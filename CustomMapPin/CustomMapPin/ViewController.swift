//
//  ViewController.swift
//  CustomMapPin
//
//  Created by Tech on 29/07/21.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    let request = MKDirections.Request()
    
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
     
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.delegate = self
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        mapView.addGestureRecognizer(tap)
        
        let p1 = CLLocation(latitude: 148.0001, longitude: -19.0001)
        let p2 = CLLocation(latitude: 188.0002, longitude: -99.0002)
        let distance = p2.distance(from: p1)

        print(distance)
        
        let sourceP         = CLLocationCoordinate2DMake(p1.coordinate.latitude, p1.coordinate.longitude)
        let destP           = CLLocationCoordinate2DMake(p2.coordinate.latitude, p2.coordinate.longitude)
        let source          = MKPlacemark(coordinate: sourceP)
        let destination     = MKPlacemark(coordinate: destP)
        request.source      = MKMapItem(placemark: source)
        request.destination = MKMapItem(placemark: destination)
        
        request.transportType = MKDirectionsTransportType.automobile;
        
        let directions = MKDirections(request: request)

        
        directions.calculate { (response, error) in
           if let response = response, let route = response.routes.first {
               print(route.distance) // You could have this returned in an async approach
           }
       }

    }
    
    
    
    func setupUI(){
        headerLbl.backgroundColor = .cyan
        headerLbl.textColor = .black
        headerLbl.font = UIFont.boldSystemFont(ofSize: 15)
        headerLbl.textAlignment = .center
        headerLbl.text = "Custom Map pin"
    }
    
    @objc func tapped(sender: UIGestureRecognizer){
        if sender.state == .began{
            sender.location(in: mapView)
            let tappedLocationView = sender.location(in: mapView)
            print(tappedLocationView)
            let locationMapView = mapView.convert(tappedLocationView, toCoordinateFrom: mapView)
            print(locationMapView)
          
            addAnnotation(locationTap: locationMapView)
            
        }
    }
    
    func addAnnotation(locationTap: CLLocationCoordinate2D){
        let location = MKPointAnnotation()
        location.coordinate = locationTap
        location.title = "Location"
        self.mapView.addAnnotation(location)
    }
    
}

extension ViewController : MKMapViewDelegate{
    
    func mapView(_mapView: MKMapView, viewFor annotation : MKAnnotation) -> MKAnnotationView?{
        let pinId = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: pinId) as? MKPinAnnotationView
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinId)
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoDark)
        
        }else{
            annotationView?.image = UIImage(named: "pin")
        }
        return annotationView
    }
    
}

extension ViewController : CLLocationManagerDelegate{

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations[0]
        print(location)
        let getArea = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        print(getArea)
        // Map Zoom :-
        let userLocationZoomLevel: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        // Get  Region :-
        let region: MKCoordinateRegion =  MKCoordinateRegion(center: getArea, span: userLocationZoomLevel)
        print(region)

        //let scale :MKZoomScale  =  MKZoomScale(5.0)
       // mapView.isZoomEnabled = true
      //  mapView.showsScale = true
        mapView.showsUserLocation = true
        mapView.setRegion(region, animated: true)

    }
}
