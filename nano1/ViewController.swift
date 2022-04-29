//
//  ViewController.swift
//  nano1
//
//  Created by putri as on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var datamodel: [Activity]?
    var actdata = actdetail
    @IBOutlet weak var activitytableView: UITableView!
    @IBOutlet weak var addBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.layer.cornerRadius = 10
        
        datamodel = actdata.getNewSchedule()
        
        let nib = UINib(nibName: "ActivityTableViewCell", bundle: nil)
        activitytableView.register(nib, forCellReuseIdentifier: "ActivityTableViewCell")
        
        activitytableView.delegate = self
        activitytableView.dataSource = self
        
    
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell", for: indexPath) as! ActivityTableViewCell
        cell.activityLabel.text = actdata[indexPath.row].act
        cell.timeLabel.text = "\(actdata[indexPath.row].hour!):\(actdata[indexPath.row].minute!) \(actdata[indexPath.row].ampm!)"
        
        return cell
    }
    
    

}

extension ViewController: addScheduleDelegate {
    
    func getNewSchedule(_ hour: String, _ minute: String, _ ampm: String, _ act: String) {
        var newSchedule = Activity(hour: hour, minute: minute, ampm: ampm, act: act)
        datamodel?.append(newSchedule)
        self.activitytableView.reloadData()
    }
        
}
