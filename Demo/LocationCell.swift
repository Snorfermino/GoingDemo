//
//  LocationCell.swift
//  Demo
//
//  Created by Tien Dat on 10/24/16.
//  Copyright © 2016 Tien Dat. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var locationTextview: UITextView!
    @IBOutlet weak var destinationTextview: UITextView!
    
    @IBOutlet weak var locationTVHeight: NSLayoutConstraint!
    
    @IBOutlet weak var destinationTVHeight: NSLayoutConstraint!
    
    @IBOutlet weak var locationTVWidth: NSLayoutConstraint!
    
    @IBOutlet weak var destinationTVWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        locationTextview.delegate = self
        destinationTextview.delegate = self
        
//        locationTextview.textContainer.maximumNumberOfLines = 2
//        locationTextview.textContainer.lineBreakMode = .byWordWrapping
        
        //let  numLines = 2
        locationTVHeight.constant =  (locationTextview.font?.lineHeight)! * 2.5
        destinationTVHeight.constant = (locationTextview.font?.lineHeight)! * 2.5
         
//        let fixedWidth = locationTextview.frame.size.width
//        let newSize = locationTextview.sizeThatFits(CGSize(width: fixedWidth, height: numLines))
//        var newFrame = locationTextview.frame
//        newFrame.size = CGSize(width: CGFloat(fmaxf(Float(newSize.width), Float(fixedWidth))),height: newSize.height);
//        locationTextview.frame = newFrame;
        
        
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension LocationCell: UITextViewDelegate {
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.setContentOffset(CGPoint(x: 0.0, y: 0.0),animated: true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.5) { 
            self.locationTVWidth.constant = 190
            self.destinationTVWidth.constant = 100
        }
        let content = textView.text!
        switch content {
        case "Current Location":
            textView.text = ""
        case "Destination":
            textView.text = ""
        default: textView.scrollToBotom()
            
            
        }
        
        
    }
}
