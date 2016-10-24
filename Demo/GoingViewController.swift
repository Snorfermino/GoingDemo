//
//  GoingViewController.swift
//  Demo
//
//  Created by Tien Dat on 10/24/16.
//  Copyright © 2016 Tien Dat. All rights reserved.
//

import UIKit
import GoogleMaps
class GoingViewController: UIViewController {

    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var tabBarView: UIView!
    
    @IBOutlet weak var transportTypePicker: UISegmentedControl!
    
    @IBOutlet weak var locationDestinationTableView: UITableView!
    
    
    override func viewWillAppear(animated: Bool) {
        self.transportTypePicker.layer.cornerRadius = 5.0;
        self.transportTypePicker.layer.borderColor = UIColor.whiteColor().CGColor
        self.transportTypePicker.layer.borderWidth = 1.0
        self.transportTypePicker.layer.masksToBounds = true
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.frame = tabBarView.bounds
        gradient.startPoint = CGPoint(x: 0, y:0)
        
        gradient.endPoint = CGPoint(x: 1, y:1)
        gradient.colors = [UIColor(netHex: 0x00d2ff).CGColor,UIColor(netHex:0x3a7bd5).CGColor ]
        tabBarView.layer.insertSublayer(gradient, atIndex: 0)
        
        transportTypePicker.removeBorders()
        
        for  borderview in transportTypePicker.subviews {
            
            let upperBorder: CALayer = CALayer()
            upperBorder.backgroundColor = UIColor.init(red: 215/255.0, green: 0.0, blue: 30/255.0, alpha: 1.0).CGColor
            upperBorder.frame = CGRectMake(0, borderview.frame.size.height-1, borderview.frame.size.width, 1.0);
            borderview.layer .addSublayer(upperBorder);
            
        }
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
//    override func loadView() {
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        let camera = GMSCameraPosition.cameraWithLatitude(-33.86, longitude: 151.20, zoom: 6.0)
//        let mapView = GMSMapView.mapWithFrame(CGRect.zero, camera: camera)
//        mapView.myLocationEnabled = true
//        self.mapView = mapView
//        
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GoingViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = locationDestinationTableView.dequeueReusableCellWithIdentifier("LocationCell") as! LocationCell
        
        
        cell.layer.cornerRadius = 2.5 //set corner radius here

        cell.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        return cell
    }
}
