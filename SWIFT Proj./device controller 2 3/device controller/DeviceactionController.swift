//
//  DeviceactionController.swift
//  device controller
//
//  Created by Mac on 08/05/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class DeviceactionController: UIViewController {

    var roomstr=""
    var lfidstr=""
    var pointstr=""
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl_room.text=roomstr
        lbl_lfid.text=lfidstr
        lbl_pointnm.text=pointstr
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var lbl_room: UILabel!
    @IBOutlet weak var lbl_lfid: UILabel!
    @IBOutlet weak var lbl_pointnm: UILabel!
    
    
    @IBOutlet weak var web_view: UIWebView!
    
    @IBAction func switch_action(_ sender: UISwitch)
    {
        if sender.isOn
        {
            let url=NSURL(string: "https://inchoative-discards.000webhostapp.com/led.php?state=1")
            let req=NSURLRequest(url: url! as URL)
            web_view.loadRequest(req as URLRequest)
            
        }
        else
        {
            let url=NSURL(string: "https://inchoative-discards.000webhostapp.com/led.php?state=0")
            let req=NSURLRequest(url: url! as URL)
            web_view.loadRequest(req as URLRequest)
            
        }

    }
    

}
