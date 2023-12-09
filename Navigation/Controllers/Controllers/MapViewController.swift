//
//  ViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 08.05.2023.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    private let locationManager = CLLocationManager()
    
    private lazy var mapController = MKMapView()
    
    private lazy var segmentView: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Standart","Hybrid","Satellite"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentControlAction), for: .valueChanged)
        
        return segmentControl
    }()
    
    private lazy var moscowButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Moscow", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.3
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(showMoacow), for: .touchUpInside)
        button.makeSystem()
        
        return button
    }()
    
    //MARK: - Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.tabBarController?.tabBar.isHidden = true
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        if locationManager.authorizationStatus == .denied {
            print("Location is denied")
        }
        layout()
    }
    
    //MARK: - Layout
    
    private func layout() {
        
        mapController.showsUserLocation = true
        if #available(iOS 17.0, *) {
            mapController.showsUserTrackingButton = true
        } else {
            // Fallback on earlier versions
        }
        
        let elements = [segmentView, mapController, moscowButton]
        elements.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            segmentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            segmentView.heightAnchor.constraint(equalToConstant: 80),
            segmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            mapController.topAnchor.constraint(equalTo: view.topAnchor),
            mapController.bottomAnchor.constraint(equalTo: segmentView.topAnchor),
            mapController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            moscowButton.heightAnchor.constraint(equalToConstant: 50),
            moscowButton.widthAnchor.constraint(equalToConstant: 100),
            moscowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            moscowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            
        ])
    }
    
    private func addAnnotation(title: String, coordinates: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = coordinates
        mapController.addAnnotation(annotation)
    }
    
    
    //MARK: - Objc func
    
    @objc private func segmentControlAction() {
        switch segmentView.selectedSegmentIndex {
        case 0:
            mapController.mapType = .standard
        case 1:
            mapController.mapType = .hybrid
        case 2:
            mapController.mapType = .satellite
        default:
            mapController.mapType = .mutedStandard
        }
    }
    
    @objc private func showMoacow() {
        let center = CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6176)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapController.setRegion(region, animated: true)
        addAnnotation(title: "Moscow", coordinates: center)
    }
    
}


//MARK: - Extenhions

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.startUpdatingLocation()
        print(locations)
    }
}
