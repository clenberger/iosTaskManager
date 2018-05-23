//
//  apptask.swift
//  iOSapptaskLibrary
//
//  Created by Christian Lenberger on 4/18/18.
//  Copyright © 2018 Christian Lenberger. All rights reserved.
//

import Foundation
import RealmSwift

class apptask: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var genre: String = ""
    @objc dynamic var dueDate: Date = Date()
    @objc dynamic var availability = true
    
}
    


