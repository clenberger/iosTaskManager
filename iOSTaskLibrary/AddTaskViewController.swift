//
//  AddtaskViewController.swift
//  iOSapptaskLibrary
//
//  Created by Christian Lenberger on 5/18/18.
//  Copyright © 2018 Christian Lenberger. All rights reserved.
//

import UIKit

class AddtaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var taskTitleTextfield: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let genres = ["School", "Work", "Home", "Everyday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
 
    

    
  
    @IBAction func saveButtonTapped(_ sender: Any) {
        if (taskTitleTextfield.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message: "Please fill in a task title", preferredStyle: .alert)
            self.present(alert, animated: true)
        } else{
            let newtask = apptask()
            newtask.title = taskTitleTextfield.text!
            newtask.genre = genres[pickerView.selectedRow(inComponent:0)]
            taskManager.sharedInstance.addtask(newtask)
            self.performSegue(withIdentifier: "unwindToLibrary", sender: self)
        }
        
    }
    
}














