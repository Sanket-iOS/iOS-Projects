//
//  AddViewController.swift
//  device controller
//
//  Created by Mac on 08/05/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddViewController: UIViewController {

    var dbref:DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        dbref=Database.database().reference()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn_show(_ sender: Any)
    {
        let show=storyboard?.instantiateViewController(withIdentifier: "device") as! DeviceViewController
        navigationController?.pushViewController(show, animated: true)
    }
    @IBOutlet weak var txt_roomno: UITextField!
    @IBOutlet weak var txt_lfid: UITextField!
    
    @IBOutlet weak var txt_pointnm: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_add(_ sender: Any)
    {
        let adddata=["RoomNo":txt_roomno.text!,
                     "LightFan ID":txt_lfid.text!,
                     "PointName":txt_pointnm.text!]
        dbref.child("DeviceAdd").childByAutoId().setValue(adddata)
        let alert=UIAlertController(title: "Success!", message: "Your device has been added!😎", preferredStyle: .alert)
        let ok=UIAlertAction(title: "Done!", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        txt_pointnm.text=""
        txt_lfid.text=""
        txt_roomno.text=""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
