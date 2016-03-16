//
//  TaskController.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    private let kTasks = "tasksKey"
    static let sharedController = TaskController()
    
    var tasksArray: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        do {
            return try moc.executeFetchRequest(request) as! [Task]
        } catch {
            return []
        }
    }
    var completedTasks: [Task] {
        return tasksArray.filter({$0.isComplete!.boolValue})
    }
    var incompleteTasks: [Task] {
        return tasksArray.filter({!$0.isComplete!.boolValue})
    }
    
    // MARK: - Persistent Storage Methods
    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Hey, there is an error. \(__FILE__) \(__LINE__)")
        }
    }
    
    // MARK: - CRUD Methods
    
    func addTask(task: Task) {
        saveToPersistentStorage()
    }
    
    func removeTask(task: Task) {
        task.managedObjectContext?.deleteObject(task)
        saveToPersistentStorage()
    }
}