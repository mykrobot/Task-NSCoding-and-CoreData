//
//  Task.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    convenience init(name: String, notes: String? = nil, dueDate: NSDate? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
    }

}
