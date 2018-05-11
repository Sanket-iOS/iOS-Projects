//
//  Reset Password ViewController.swift
//  device controller
//
//  Created by TOPS on 21/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class Reset_Password_ViewController: UIViewController {

    @IBOutlet var reset_nav: UINavigationBar!
    
    @IBOutlet var reset_img: UIImageView!
    
    @IBOutlet var email_img2: UIImageView!
    
    @IBOutlet var email_txt2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset_btn(_ sender: Any)
    {
        if self.email_txt2.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().sendPasswordReset(withEmail: self.email_txt2.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                }
                else
                {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.email_txt2.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
}
