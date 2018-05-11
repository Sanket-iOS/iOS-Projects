//
//  Present Screen ViewController.swift
//  device controller
//
//  Created by TOPS on 26/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class Present_Screen_ViewController: UIViewController {

    @IBOutlet var Present_nav: UINavigationBar!
    
    @IBOutlet var Hall_lbl: UILabel!
    
    @IBOutlet var kitchen_lbl: UILabel!
    
    @IBOutlet var present_img: UIImageView!
    
    @IBOutlet var light_tv1: UITextView!
    
    @IBOutlet var fan_tv1: UITextView!
    
    @IBOutlet var light_tv2: UITextView!
    
    @IBOutlet var fan_tv2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func light_btn1(_ sender: Any)
    {
        let lnxt=storyboard?.instantiateViewController(withIdentifier: "Light") as! Light_ViewController
        navigationController?.pushViewController(lnxt, animated: true)
        }
    
    
    @IBAction func fan_btn1(_ sender: Any)
    {
        let fnxt=storyboard?.instantiateViewController(withIdentifier: "Fan") as! Fan_ViewController
        navigationController?.pushViewController(fnxt, animated: true)
    }
    
    
    @IBAction func light_btn2(_ sender: Any)
    {
        
    }
    
    
    @IBAction func fan_btn2(_ sender: Any)
    {
        
    }
}
    
