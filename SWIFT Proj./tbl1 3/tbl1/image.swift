//
//  image.swift
//  tbl1
//
//  Created by TOPS on 13/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
var str = ""

class image: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var img_o: UIImageView!
    @IBAction func img_bt(_ sender: Any)
    {
        let photo=UIImagePickerController()
        photo.delegate=self
        present(photo, animated: true, completion: nil)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let img=info[UIImagePickerControllerOriginalImage] as! UIImage
        img_o.image=img
        dismiss(animated: true, completion: nil)
    }
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
