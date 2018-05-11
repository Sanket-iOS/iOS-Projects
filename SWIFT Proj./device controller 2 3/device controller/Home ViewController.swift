//
//  Home ViewController.swift
//  device controller
//
//  Created by TOPS on 21/03/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class Home_ViewController: UIViewController {

    var str=""
    var name=""
    var tm=Timer()

    @IBOutlet var home_nav: UINavigationBar!
    
    @IBOutlet var home_img: UIImageView!
    
    @IBOutlet var welcome_lbl: UILabel!
    
    @IBOutlet var name_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        name_lbl.text=name
        
        tm=Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(Home_ViewController.main), userInfo: nil, repeats: false)
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func main()
    {
        let nxt=storyboard?.instantiateViewController(withIdentifier: "addlist") as! ListViewController
        
        navigationController?.pushViewController(nxt, animated: true)
    }
    
  }
