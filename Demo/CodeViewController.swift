//
//  CodeViewController.swift
//  Demo
//
//  Created by Tien Dat on 10/26/16.
//  Copyright © 2016 Tien Dat. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController {
    
    @IBOutlet weak var EnterVeriCodeTopGuide: NSLayoutConstraint!

    @IBOutlet weak var textFieldOne: UITextField!
    
    
    @IBOutlet weak var textFieldTwo: UITextField!
    
    @IBOutlet weak var textFieldThree: UITextField!
    
    @IBOutlet weak var textFieldFour: UITextField!
    
    @IBOutlet weak var lineOne: UIImageView!

    @IBOutlet weak var lineTwo: UIImageView!
    
    @IBOutlet weak var lineThree: UIImageView!
    
    @IBOutlet weak var lineFour: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        //EnterVeriCodeTopGuide.constant = UIScreen.main.bounds.height * (97/1334)
        
        textFieldOne.tag = 1
        textFieldTwo.tag = 2
        textFieldThree.tag = 3
        textFieldFour.tag = 4
        
        textFieldOne.delegate = self
        textFieldTwo.delegate = self
        textFieldThree.delegate = self
        textFieldFour.delegate = self
        
        textFieldOne.text = ""
        textFieldTwo.text = ""
        textFieldThree.text = ""
        textFieldFour.text = ""
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func focusLine(tag:Int){
        switch tag {
        case 1:
            lineOne.image = UIImage(named: "lineBlueBold")
            lineOne.frame.size.height = 4
        case 2:
            lineTwo.image = UIImage(named: "lineBlueBold")
            lineTwo.frame.size.height = 4
        case 3:
            lineThree.image = UIImage(named: "lineBlueBold")
            lineThree.frame.size.height = 4
        case 4:
            lineFour.image = UIImage(named: "lineBlueBold")
            lineFour.frame.size.height = 4
        default:
            print("defaultFocusline")
        }
    }
    
    func removeFocusLine(tag:Int){
        switch tag {
        case 1:
            lineOne.image = UIImage(named: "lineBlueLight")
            lineOne.frame.size.height = 2
        case 2:
            lineTwo.image = UIImage(named: "lineBlueLight")
            lineTwo.frame.size.height = 2
        case 3:
            lineThree.image = UIImage(named: "lineBlueLight")
            lineThree.frame.size.height = 2
        case 4:
            lineFour.image = UIImage(named: "lineBlueLight")
            lineFour.frame.size.height = 2
        default:
            print("defaultFocusline")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CodeViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        focusLine(tag: textField.tag)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        removeFocusLine(tag: textField.tag)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            textField.becomeFirstResponder()
            
        }
        // On inputing value to textfield
        if ((textField.text?.characters.count)! < 1  && string.characters.count > 0){
            let nextTag = textField.tag + 1
            
            // get next responder
            let nextResponder = textField.superview?.viewWithTag(nextTag)
            
            if (nextResponder == nil){
                textField.resignFirstResponder()
            }
            textField.text = string;
            nextResponder?.becomeFirstResponder()
           
            return false
        }
        else if ((textField.text?.characters.count)! >= 1  && string.characters.count == 0){
            // on deleteing value from Textfield
            let previousTag = textField.tag - 1
            
            // get next responder
            var previousResponder = textField.superview?.viewWithTag(previousTag)
            
            if (previousResponder == nil){
                previousResponder = textField.superview?.viewWithTag(1)
            }
            textField.text = ""
            previousResponder?.becomeFirstResponder()
            
            return false
        }
               return true
    }
}
