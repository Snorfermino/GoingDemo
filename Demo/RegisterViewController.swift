//
//  RegisterViewController.swift
//  Demo
//
//  Created by Tien Dat on 10/26/16.
//  Copyright © 2016 Tien Dat. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var GoButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        
       GoButton.layer.cornerRadius = GoButton.frame.size.height / 2
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        firstNameTextField.addBottomBorder()
        lastNameTextField.addBottomBorder()
        emailTextField.addBottomBorder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        //firstNameTextField.placeholder = "First Name"
        self.view.layoutIfNeeded()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        avatarImageView.layer.masksToBounds = true
        //avatarImageView.clipsToBounds = true
        
        firstNameTextField.placeHolder(placeHolder: "First Name")
        lastNameTextField.placeHolder(placeHolder: "Last Name")
        emailTextField.placeHolder(placeHolder: "Email")
        // Do any additional setup after loading the view.
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

extension RegisterViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 3, delay: 0.5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            textField.text = ""
            textField.textColor = UIColor.black
            textField.textAlignment = NSTextAlignment.center

            }, completion: nil)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField.text == ""){
            textField.textAlignment = NSTextAlignment.left
        }
    }
}
