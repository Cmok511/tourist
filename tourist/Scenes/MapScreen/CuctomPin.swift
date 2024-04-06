//
//  CuctomPin.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation
import UIKit
import MapKit

final class CustomPin: NSObject,  MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

