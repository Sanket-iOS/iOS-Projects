//
//  ViewController.swift
//  tbl1
//
//  Created by TOPS on 12/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    // signup
    
    @IBAction func acc_bt(_ sender: Any)
    {
        let cnxt=storyboard?.instantiateViewController(withIdentifier: "log") as! login
        //present(nxt, animated: true, completion: nil)
        cnxt.str=txt_2.text!
        navigationController?.pushViewController(cnxt, animated: true)
        }
    @IBAction func re_bt(_ sender: Any)
    {
        
    }
    
    
    
    @IBOutlet var txt_2: UITextField!

    @IBOutlet var txt_1: UITextField!
    
    @IBAction func ok_b(_ sender: Any)
    {
        
        
            if txt_1.text == ""
            {
                let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
               
                present(alertController, animated: true, completion: nil)
               
                
            }
            else
            {
                Auth.auth().createUser(withEmail: txt_1.text!, password: txt_2 .text!) { (user, error) in
                    
                    if error == nil
                    {
                        print("You have successfully signed up")
                        
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "act") as! activity
                        self.present(vc, animated: true, completion: nil)
                        
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
   

// let nxt=storyboard?.instantiateViewController(withIdentifier: "act") as! activity
//nxt.str=txt_2.text!
//navigationController?.pushViewController(nxt, animated: true)
