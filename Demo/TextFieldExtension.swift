//
//  TextFieldExtension.swift
//  Demo
//
//  Created by Tien Dat on 10/26/16.
//  Copyright © 2016 Tien Dat. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func addBottomBorder(){
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(netHex: 0xe6e6e6).cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width:  frame.size.width, height: frame.size.height)
        
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    func placeHolder(placeHolder: String){
        text = placeHolder
        placeholder = placeHolder
        textColor = UIColor.lightGray
        textAlignment = NSTextAlignment.left
    }
    
    
    
    
}
