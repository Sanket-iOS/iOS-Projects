//
//  List.swift
//  device controller
//
//  Created by TOPS on 25/04/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ListViewController: UIViewController
{
    
    
    var limg = UIImage()
    var ltxt = ""
    var arr = Array<Any>()
    
    
    @IBOutlet weak var bck_img: UIImageView!
    
    
    @IBOutlet weak var light_img: UIImageView!

    
    @IBOutlet weak var txtview_desc: UITextView!
    
    
    @IBOutlet weak var lbl_add: UILabel!
    
    
    
    @IBAction func btn_signout(_ sender: Any)
    {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let main=storyboard?.instantiateViewController(withIdentifier: "Login")
                present(main!, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationItem.hidesBackButton=true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func seg(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        {
            let txtlight = "You can turn On or Off your home's light by one touch"
            light_img.image=UIImage(named: "light-bulb (2).png")
            txtview_desc.text = txtlight
            
            
        }
        else
        {
            let txtfan = "You can turn On or Off your home's fan by one touch"
            light_img.image=UIImage(named: "fan (6).png")
            txtview_desc.text = txtfan
        }
        
        
    }
    
    
   
    
    
    @IBAction func btn_add(_ sender: UIButton)
    {
        
        let addview=storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        navigationController?.pushViewController(addview, animated: true)
        
    }
    
    
}
