//
//  MapViewController.swift
//  MyLocations
//
//  Created by Jovanny Espinal on 1/1/16.
//  Copyright © 2016 Jovanny Espinal. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var managedObjectContext: NSManagedObjectContext!
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLocations() 
    }
    
    @IBAction func showUser() {
        let region = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, 1000, 1000)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
    
    @IBAction func showLocations() {
        
    }
    
    func updateLocations() {
        mapView.removeAnnotations(locations)
        
        let entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: managedObjectContext)
        
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entity
        
        locations = try! managedObjectContext.executeFetchRequest(fetchRequest) as! [Location]
        mapView.addAnnotations(locations)
    }
    
//    func regionForAnnotations(annotations: [MKAnnotation]) -> MKCoordinateRegion {
//        var region: MKCoordinateRegion
//        
//        switch annotations.count {
//        case 0:
//            region = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, 1000, 1000)
//            
//        case 1:
//            let annotation = annotations[annotations.count - 1]
//            region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 1000, 1000)
//            
//        default:
//            var topLeftCoord = CLLocationCoordinate2D(latitude: -90, longitude: 180)
//            var bottomRightCoord = CLLocationCoordinate2D(latitude: 90, longitude: -180)
//            
//            for annotation in annotations {
//                topLeftCoord.latitude = max(topLeftCoord.latitude, annotation.coordinate.latitude)
//                topLeftCoord.longitude = max(topLeftCoord.longitude, annotation.coordinate.longitude)
//                bottomRightCoord.latitude = max(bottomRightCoord.latitude, annotation.coordinate.latitude)
//                bottomRightCoord.longitude = max(bottomRightCoord.longitude, annotation.coordinate.longitude)
//            }
//            
//            let center = CLLocationCoordinate2D(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
//        }
    
    }
}

extension MapViewController: MKMapViewDelegate {
    
}