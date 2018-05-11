//
//  DeviceViewController.swift
//  device controller
//
//  Created by Mac on 08/05/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DeviceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var devicetable: UITableView!
    var db:DatabaseReference!
    var devicedata = [DeviceView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        db=Database.database().reference().child("DeviceAdd")
        device()
        // Do any additional setup after loading the view.
    }
    func device()
    {
        db.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.devicedata.removeAll()
                
                
                //iterating through all the values
                for dt in snapshot.children.allObjects as! [DataSnapshot]
                {
                    //getting values
                    let device = dt.value as? [String: AnyObject]
                    let roomno  = device?["RoomNo"]
                    let lfid  = device?["LightFan ID"]
                    let pointnm = device?["PointName"]
                    
                    //creating artist object with model and fetched values
                    let finaldata = DeviceView(roomid: roomno as! String?, lfid: lfid as! String?, pointnm: pointnm as! String?)
                    
                    //appending it to list
                    self.devicedata.append(finaldata)
                    print(finaldata)
                }
                
                //reloading the tableview
                self.devicetable.reloadData()
            }
        })
    }

    class DeviceView
    {
        
        var roomid: String?
        var lfid: String?
        var pointnm: String?
        
        init(roomid: String?, lfid: String?, pointnm: String?){
            self.roomid = roomid
            self.lfid = lfid
            self.pointnm = pointnm
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return devicedata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let dt=devicedata[indexPath.row]
        var cell = TableViewCell()
        cell=tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lbl_room.text=dt.roomid
        cell.lbl_lfid.text=dt.lfid
        cell.lbl_pointnm.text=dt.pointnm
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let dt=devicedata[indexPath.row]
        let actionview=storyboard?.instantiateViewController(withIdentifier: "action") as! DeviceactionController
        actionview.roomstr=dt.roomid!
        actionview.lfidstr=dt.lfid!
        actionview.pointstr=dt.pointnm!
        self.navigationController?.pushViewController(actionview, animated: true)
        
        
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        devicedata.remove(at: indexPath.row)
        devicetable.reloadData()
    }
    
    
    
}
