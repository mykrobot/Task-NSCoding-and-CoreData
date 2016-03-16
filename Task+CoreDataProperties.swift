//
//  Task+CoreDataProperties.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var dueDate: NSDate?
    @NSManaged var isComplete: NSNumber?
    @NSManaged var name: String?
    @NSManaged var notes: String?

}
