//
//  ViewController.swift
//  Simple MapView
//
//  Created by Sang won Seo on 2018. 6. 4..
//  Copyright © 2018년 Sang won Seo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let center = CLLocationCoordinate2D(latitude: 35.167574, longitude: 129.070568)
//        let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
//        let region = MKCoordinateRegion(center: center, span: span)
//        myMapView.setRegion(region, animated: true)
        // annotaion 추가
        
        let region = MKCoordinateRegionMakeWithDistance(center, 1000, 1000)
        myMapView.setRegion(region, animated: true)
        
        //번개반점의 주소를 위도, 경도로 변환 : geocoding
        let addr = "부산광역시 부산진구 양정1동 418-260"
        let geoCoder = CLGeocoder()
        //후행
        geoCoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error: Error? ) -> Void in
            if let error = error {
                print(error)
                return
            }
            if placemarks != nil {
                let placemark = placemarks![0]
                print(placemark.location!.coordinate)
                let loc01 = placemark.location?.coordinate
                let anno01 = MKPointAnnotation()
                anno01.coordinate = loc01!
                anno01.title = "번개반점"
                anno01.subtitle = addr
                self.myMapView.addAnnotation(anno01)
            } else {
                print("nil")
            }
        }
        
//        let loc01 = CLLocationCoordinate2D(latitude: 35.165631, longitude: 129.072414)
//        let anno01 = MKPointAnnotation()
//        anno01.coordinate = loc01
//        anno01.title = "번개반점"
//        anno01.subtitle = "부산광역시 부산진구 양정1동 418-260"
//        myMapView.addAnnotation(anno01)
//        //35.167574, 129.070568
//
//
//
//        let anno02 = MKPointAnnotation()
//        anno02.coordinate = center
//        anno02.title = "동의과학대학교"
//        myMapView.addAnnotation(anno02)
//        //35.165631, 129.072414
//
//        let loc02 = CLLocationCoordinate2D(latitude: 35.167936, longitude: 129.070403)
//        let anno03 = MKPointAnnotation()
//        anno03.coordinate = loc02
//        anno03.title = "토마토도시락"
//        myMapView.addAnnotation(anno03)
//        //35.167936, 129.070403
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

