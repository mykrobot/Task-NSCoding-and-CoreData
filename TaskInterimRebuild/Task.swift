//
//  Task.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding{
    private let kName = "titleKey"
    private let kNotes = "notesKey"
    private let kDueDate = "dueDateKey"
    private let kIsComplete = "isCompleteKey"
    
    
    var name: String
    var notes: String?
    var dueDate: NSDate?
    var isComplete: Bool
    
    init(name: String, notes: String? = nil, dueDate: NSDate? = nil, isComplete: Bool = false) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
        
    }
    
    //MARK: -  NSCoding Methods
    
    @objc required init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObjectForKey(kName) as? String else {
            self.name = ""
            self.notes = ""
            self.dueDate = nil
            self.isComplete = false
            super.init()
            return nil
        }
        self.name = name
        self.notes = aDecoder.decodeObjectForKey(kNotes) as? String
        self.dueDate = aDecoder.decodeObjectForKey(kDueDate) as? NSDate
        self.isComplete = aDecoder.decodeObjectForKey(kIsComplete) as! Bool
        super.init()
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: kName)
        aCoder.encodeObject(self.notes, forKey: kNotes)
        aCoder.encodeObject(self.dueDate, forKey: kDueDate)
        aCoder.encodeObject(self.isComplete, forKey: kIsComplete)
    }
    
}
//func ==(lhs: Task, rhs: Task) -> Bool {
//    return lhs.name == rhs.name && lhs.isComplete == rhs.isComplete
//}
