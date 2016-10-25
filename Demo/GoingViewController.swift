//
//  GoingViewController.swift
//  Demo
//
//  Created by Tien Dat on 10/24/16.
//  Copyright © 2016 Tien Dat. All rights reserved.
//

import UIKit
import GoogleMaps
import NXTSegmentedControl
class GoingViewController: UIViewController {

    
    
    
    @IBOutlet weak var tabBarView: UIView!
    
    @IBOutlet weak var transportTypePicker: UISegmentedControl!
    
    @IBOutlet weak var locationDestinationTableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.transportTypePicker.layer.cornerRadius = 5.0;
        self.transportTypePicker.layer.borderColor = UIColor.white.cgColor
        self.transportTypePicker.layer.borderWidth = 1.0
        self.transportTypePicker.layer.masksToBounds = true
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.frame = CGRect(x: 0, y: 0, width: tabBarView.frame.size.width, height: tabBarView.frame.size.height)
        
        gradient.startPoint = CGPoint(x: 0, y:0)
        
        gradient.endPoint = CGPoint(x: 1 , y:1)
        gradient.colors = [UIColor(netHex: 0x00d2ff).cgColor,UIColor(netHex:0x3a7bd5).cgColor ]
        tabBarView.layer.insertSublayer(gradient, at: 0)
        
        transportTypePicker.removeBorders()
        
        locationDestinationTableView.estimatedRowHeight = 112
        locationDestinationTableView.rowHeight  = UITableViewAutomaticDimension
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension GoingViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationDestinationTableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
        
        
        cell.layer.cornerRadius = 2.5

        cell.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
 
        return cell
    }
    
    
    
    
}




