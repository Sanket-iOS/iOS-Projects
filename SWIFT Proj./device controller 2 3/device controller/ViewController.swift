//
//  ViewController.swift
//  device controller
//
//  Created by TOPS on 21/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet var log_nav: UINavigationItem!
    
    @IBOutlet var log_img: UIImageView!
    
    @IBOutlet var name_img: UIImageView!
    
    @IBOutlet var email_img: UIImageView!
    
    @IBOutlet var name_txt: UITextField!
    
    @IBOutlet var email_txt: UITextField!
    
    @IBOutlet var password_txt: UITextField!
    
    var iconClick = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func log_btn(_ sender: Any)
    {
        if self.email_txt.text == "" || self.password_txt.text == "" {
            
        let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
        self.present(alertController, animated: true, completion: nil)
            }
        else
        {
            
            Auth.auth().signIn(withEmail: self.email_txt.text!, password: self.password_txt.text!) { (user, error) in
                if error == nil
                {
                    print("You have successfully logged in")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! Home_ViewController
                    
                    vc.name=self.name_txt.text!
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
    
    @IBAction func newacc_btn(_ sender: Any)
    {
        let nxt=storyboard?.instantiateViewController(withIdentifier: "Sign Up") as! Sign_Up_ViewController
        navigationController?.pushViewController(nxt, animated: true)

    }
    
    @IBAction func forget_btn(_ sender: Any)
    {
        let fnxt=storyboard?.instantiateViewController(withIdentifier: "Reset Password") as! Reset_Password_ViewController
        navigationController?.pushViewController(fnxt, animated: true)

    }
    @IBAction func password_btn1(_ sender: Any)
    {
        if(iconClick == true)
        {
            password_txt.isSecureTextEntry = false
            (sender as AnyObject).setImage(UIImage.init(named: "hide.png"), for: .normal)
            
            iconClick = false
        }
        else
        {
            password_txt.isSecureTextEntry = true
            iconClick = true
            (sender as AnyObject).setImage(UIImage.init(named: "eye.png"), for: .normal)
        }

       }

}

