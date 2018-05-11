//
//  activity.swift
//  tbl1
//
//  Created by TOPS on 13/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
var astr = ""
class activity: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var act_ttl: UITextField!
    
    

    @IBOutlet var act_nm: UITextField!
    
    @IBOutlet var act_img: UITextField!
    
    @IBAction func ok(_ sender: Any)
    {
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


