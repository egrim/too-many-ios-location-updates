//
//  LocationManager.swift
//  TooMany
//
//  Created by Evan Grim on 5/10/21.
//  Copyright © 2021 Evan Grim. All rights reserved.
//

import CoreLocation


class LocationManager: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    override init() {
        super.init()

        self.locationManager.delegate = self
        self.locationManager.allowsBackgroundLocationUpdates = true
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("didChangeAuthorization: authorizationStatus=\(CLLocationManager.authorizationStatus().debug)")
    }
}

extension CLAuthorizationStatus {
    var debug: String {
        switch self {
        case .notDetermined: return "notDetermined"
        case .restricted: return "restricted"
        case .denied: return "denied"
        case .authorizedAlways: return "authorisedAlways"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        @unknown default: return "unknown \(self.rawValue)"
        }
    }
}
