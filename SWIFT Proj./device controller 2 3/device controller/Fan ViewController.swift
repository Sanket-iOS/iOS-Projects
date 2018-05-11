//
//  Fan ViewController.swift
//  device controller
//
//  Created by TOPS on 26/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class Fan_ViewController: UIViewController {

    @IBOutlet var fan_nav: UINavigationBar!
    
    @IBOutlet var fan_img: UIImageView!
    
    @IBOutlet var fan_img1: UIImageView!
    
    @IBOutlet var fan_swi: UISwitch!
    
    @IBOutlet var fan_web: UIWebView!
    
    @IBOutlet weak var f_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fan_switch(_ sender: UISwitch)
    {
        if sender.isOn
        {
            let url=NSURL(string: "http://topsiot.16mb.com/iot/led1.php?state=1")
            let req=NSURLRequest(url: url! as URL)
            fan_web.loadRequest(req as URLRequest)
            
        }
        else
        {
            let url=NSURL(string: "http://topsiot.16mb.com/iot/led1.php?state=0")
            let req=NSURLRequest(url: url! as URL)
            fan_web.loadRequest(req as URLRequest)
            
        }
     }
    }
