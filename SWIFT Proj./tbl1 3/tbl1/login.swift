//
//  login.swift
//  tbl1
//
//  Created by TOPS on 13/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class login: UIViewController {
var str=""
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    @IBOutlet var user_n: UITextField!
    
    @IBOutlet var password: UITextField!

    @IBAction func ok_l(_ sender: Any)
    { if self.user_n.text == "" || self.password.text == "" {
        
        
        let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    } else {
        
        Auth.auth().signIn(withEmail: self.user_n.text!, password: self.password.text!) { (user, error) in
            
            if error == nil {
                
                
                print("You have successfully logged in")
                
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "act")
                self.present(vc!, animated: true, completion: nil)
                
            } else {
                
                
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        }
    }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


