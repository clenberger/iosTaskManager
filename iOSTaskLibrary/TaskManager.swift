//
//  taskManager.swift
//  iOSapptaskLibrary
//
//  Created by Christian Lenberger on 5/19/18.
//  Copyright © 2018 Christian Lenberger. All rights reserved.
//

import Foundation
import RealmSwift

final class taskManager {
    
    static let sharedInstance = taskManager()
    
    private init() {
        tasks = realm.objects(apptask.self)
    }
    
    let realm = try! Realm()
    
    let calendar = Calendar.current
    
    var tasks: Results<apptask>!
    
    func addtask(_ task: apptask) {
        try! realm.write {
            realm.add(task)
        }
    }
    
    func removetask(_ task: apptask) {
        try! realm.write {
            realm.delete(task)
        }
    }
    
    func gettask(index: Int) -> apptask {
        return tasks[index]
    }
    
    func gettaskCount() -> Int {
        return tasks.count
    }
    
    
    func checkInOrOut(task: apptask) {
        try! realm.write {
            if task.availability {
                task.availability = false
                task.dueDate = calendar.date(byAdding: .day, value: 3, to: Date())!
            } else {
                task.availability = true
                task.dueDate = Date()
            }
        }
    }
}
