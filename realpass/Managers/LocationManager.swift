//
//  LocationManager.swift
//  Specialz
//
//  Created by i-Phone on 4/30/19.
//  Copyright © 2019 i-Verve. All rights reserved.
//

import MapKit

protocol LocationManagerDelegate {
    func currentLocation(latitude: Double, longitude: Double) -> Void
}

class LocationManager: NSObject {
    
    // MARK: - Variables
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    private var autoStop: Bool = false, isCalledOnce: Bool = false, delegate: LocationManagerDelegate?
    
    // MARK: - Lifecycle
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.pausesLocationUpdatesAutomatically = false
    }
    
    // MARK: - CustomMethods
    func askForPermission() -> Void {
        locationManager.requestAlwaysAuthorization()
    }
    
    private func isLocationPermissionGiven() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied: return false
            case .authorizedAlways, .authorizedWhenInUse: return true
            @unknown default:
                fatalError()
            }
        } else { 
            return false
        }
    }
    
    func getCurrentLocation(delegate: LocationManagerDelegate, autoStop: Bool, vc: UIViewController) -> Void {
        self.delegate = delegate
        if isLocationPermissionGiven() {
            self.autoStop = autoStop
            isCalledOnce = !autoStop
            locationManager.startUpdatingLocation()
        } else {
           //jatin vc.alert(message: Messages.locationPermissionNotGiven, showSettings: true, showCancelTitle: Messages.cancel)
        }
    }
    
    func stopUpdatingLocation() -> Void {
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let last = locations.last else { return }
        
        if autoStop {
            manager.stopUpdatingLocation()
        }
        
        guard !isCalledOnce, autoStop else { return }
        isCalledOnce = true
        delegate?.currentLocation(latitude: last.coordinate.latitude, longitude: last.coordinate.longitude)
//        delegate?.currentLocation(latitude: 23.047294, longitude: 72.56740935981747)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        print(status.rawValue)
    }
}
