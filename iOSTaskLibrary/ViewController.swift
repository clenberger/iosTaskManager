//
//  ViewController.swift
//  iOSapptaskLibrary
//
//  Created by Christian Lenberger on 5/12/18.
//  Copyright © 2018 Christian Lenberger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.sharedInstance.gettaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! taskTableViewCell
        cell.setUpCell(task: taskManager.sharedInstance.gettask(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
   // func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   tableView.deselectRow(at: indexPath, animated: false)
   // }
    
    @IBAction func unwindToLibrary(segue:UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let task = taskManager.sharedInstance.gettask(index: indexPath.row)
        
        let title = task.availability ? "Completed" : "Incomplete"
        
        let checkOutAction = UITableViewRowAction(style: .normal, title: title) { (_,_) in
            
            taskManager.sharedInstance.checkInOrOut(task: task)
            
            tableView.reloadData()
            
        }
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            taskManager.sharedInstance.removetask(task)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        return [deleteAction, checkOutAction]
    }
    
    
}

