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
    

    
    @IBOutlet weak var locationView: UIView!
    
    
    @IBOutlet weak var destinationView: UIView!
    
    
    @IBOutlet weak var locationViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var destinationViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var locationViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var destinationViewWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var LoctionViewWidthRatio: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        locationTextview.delegate = self
        destinationTextview.delegate = self
        locationTextview.tag = 1
        destinationTextview.tag = 2
        locationViewHeight.constant = (locationTextview.font?.lineHeight)! * 2.5
        destinationViewHeight.constant = (destinationTextview.font?.lineHeight)! * 2.5
        
    }
    
    func animation() {
        self.LoctionViewWidthRatio.constant = 100
        CATransaction.begin()
        CATransaction.setAnimationDuration(4)
        setNeedsDisplay()
        CATransaction.commit()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension LocationCell: UITextViewDelegate {
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
                switch textView.tag {
        case 1:
            UIView.animate(withDuration: 1) {
                
                //self.locationViewWidth.constant = (textSize?.width)!
                
                textView.textContainer.maximumNumberOfLines = 2
                textView.textContainer.lineBreakMode = .byTruncatingTail
                //textView.setContentOffset(CGPoint(x: 0.0, y: 0.0),animated: true)
                textView.scrollToTop()

                
            }
        case 2:
            UIView.animate(withDuration: 1) {
                
               // self.destinationViewWidth.constant = (textSize?.width)!
                textView.textContainer.maximumNumberOfLines = 2
                
                textView.textContainer.lineBreakMode = .byTruncatingTail
                textView.setContentOffset(CGPoint(x: 0.0, y: 0.0),animated: true)

                
            }
        default:
                print("something")
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
//        let fixedWidth = destinationTextview.frame.size.width
//        destinationTextview.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        let newSize = destinationTextview.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        var newFrame = destinationTextview.frame
//        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//        destinationTextview.frame = newFrame
        
        textView.textContainer.maximumNumberOfLines = 10
        
               
        animation()
       
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
