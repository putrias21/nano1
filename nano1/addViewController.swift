//
//  addViewController.swift
//  nano1
//
//  Created by putri as on 28/04/22.
//

import UIKit

protocol addScheduleDelegate{
    func getNewSchedule( _ hour: String, _ minute: String, _ ampm: String, _ act: String)
}

class addViewController: UIViewController, UITextFieldDelegate {
    
    var delegate : addScheduleDelegate?

    @IBOutlet weak var timePickerView: UIDatePicker!
    @IBOutlet weak var timeTextField: UITextField!
    @IBAction func edittime(_ sender: UITextField) {
        let timePickerView:UIDatePicker = UIDatePicker()
        timePickerView.datePickerMode = UIDatePicker.Mode.time
        
      //  timePickerView.addTarget(self, action: #selector(timePickerView.), for: UIControl.Event.valueChanged)
        
    }
    
    @IBAction func timePickerUpdate(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timeTextField.text = formatter.string(from: timePickerView.date)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("test")
    }
    
    func openTimePicker()  {
        timePickerView.datePickerMode = UIDatePicker.Mode.time
        timePickerView.frame = CGRect(x: 0.0, y: (self.view.frame.height/2 + 60), width: self.view.frame.width, height: 150.0)
        timePickerView.backgroundColor = UIColor.white
        self.view.addSubview(timePickerView)
        timePickerView.addTarget(self, action: #selector(addViewController.startTimeDiveChanged), for: UIControl.Event.valueChanged)
    }

    @objc func startTimeDiveChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timeTextField.text = formatter.string(from: sender.date)
        timePickerView.removeFromSuperview()
    }
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var editactivity: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.layer.cornerRadius = 10
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timeTextField.text = formatter.string(from: timePickerView.date)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        guard let hour = timeTextField.text else{
                    fatalError("hour is Nil")
                }
        guard let minute = timeTextField.text else{
                    fatalError("minute is Nil")
                }
        guard let ampm = timeTextField.text else{
                    fatalError("ampm is nil")
                }
    guard let actname = editactivity.text else{
                    fatalError("Activity Name is Nil")
                }
                delegate?.getNewSchedule(hour, minute, ampm, actname)
    }
    
    @IBAction func cleartxt(_ sender: Any) {
        editactivity.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
