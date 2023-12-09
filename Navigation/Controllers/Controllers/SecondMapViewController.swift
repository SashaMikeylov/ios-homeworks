//
//  SecondMapViewCOntroller.swift
//  Navigation
//
//  Created by Денис Кузьминов on 08.12.2023.
//

import UIKit
import MapKit
import CoreLocation

class SecondMapViewController: UIViewController {
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    var distanceAnnotation: MKAnnotation?
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.3
        button.layer.borderColor = UIColor.black.cgColor
        button.makeSystem()
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        mapView.showsUserLocation = true
        if #available(iOS 17.0, *) {
            mapView.showsUserTrackingButton = true
        } else {
            // Fallback on earlier versions
        }
        navigationController?.tabBarController?.tabBar.isHidden = true
        let longtap = UILongPressGestureRecognizer(target: self, action: #selector(longTapPressed))
        mapView.addGestureRecognizer(longtap)
        mapView.delegate = self
        layout()
    }
    
    //MARK: - Layout
    
    private func layout() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
        ])
    }
    
    private func addAnnotation(coordinates: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        mapView.addAnnotation(annotation)
        distanceAnnotation = annotation
    }
    
    //MARK: - Objc func
    
    @objc private func longTapPressed(sender: UILongPressGestureRecognizer) {
        let point = sender.location(in: mapView)
        let coordinates = mapView.convert(point, toCoordinateFrom: mapView)
        addAnnotation(coordinates: coordinates)
    }
    
    @objc private func buttonPressed() {
        guard let distanceAnnotation else {return}
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.userLocation.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: distanceAnnotation.coordinate))
        
        let direction = MKDirections(request: request)
        direction.calculate { response, error in
            if let response, let route = response.routes.first {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
}

//MARK: - Extensions

extension SecondMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.startUpdatingLocation()
    }
}

extension SecondMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = 3.0
        
        return renderer
    }
}
