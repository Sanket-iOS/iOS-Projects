//
//  Sign Up ViewController.swift
//  device controller
//
//  Created by TOPS on 21/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class Sign_Up_ViewController: UIViewController {

    @IBOutlet var signup_nav: UINavigationBar!
    
    @IBOutlet var sign_img: UIImageView!
    
    @IBOutlet var name_img1: UIImageView!
    
    @IBOutlet var email_img1: UIImageView!
    
    @IBOutlet var name_txt1: UITextField!
    
    @IBOutlet var email_txt1: UITextField!
    
    @IBOutlet var password_txt1: UITextField!
    
    var iconClick = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func password_btn(_ sender: Any)
    {
        if(iconClick == true)
        {
            password_txt1.isSecureTextEntry = false
            (sender as AnyObject).setImage(UIImage.init(named: "hide.png"), for: .normal)
            
            iconClick = false
        }
        else
        {
            password_txt1.isSecureTextEntry = true
            iconClick = true
            (sender as AnyObject).setImage(UIImage.init(named: "eye.png"), for: .normal)
        }
        
    }
    
    @IBAction func signup_btn(_ sender: Any)
    {
        if email_txt1.text == "" || password_txt1.text==""
        {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
            Auth.auth().createUser(withEmail: email_txt1.text!, password: password_txt1.text!) { (user, error) in
                
                if error == nil
                {
                    print("You have successfully signed up")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! Home_ViewController
                    
                    vc.name=self.name_txt1.text!
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
                else
                {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

    }
}
