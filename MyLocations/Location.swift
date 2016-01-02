//
//  Location.swift
//  MyLocations
//
//  Created by Jovanny Espinal on 12/27/15.
//  Copyright © 2015 Jovanny Espinal. All rights reserved.
//

import Foundation
import MapKit
import CoreData


class Location: NSManagedObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    
    var subtitle: String? {
        return category
    }
}


