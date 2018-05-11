//
//  showact.swift
//  tbl1
//
//  Created by TOPS on 13/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class showact: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet var list_act: UITextField!
    
    @IBAction func Ok_show(_ sender: Any) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var lbl_show: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
