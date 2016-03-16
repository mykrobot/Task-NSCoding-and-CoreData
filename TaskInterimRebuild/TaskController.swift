//
//  TaskController.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class TaskController {
    private let kTasks = "tasksKey"
    static let sharedController = TaskController()
    
    var tasksArray: [Task] = []
    var completedTasks: [Task] {
        return tasksArray.filter({$0.isComplete.boolValue})
    }
    var incompleteTasks: [Task] {
        return tasksArray.filter({!$0.isComplete.boolValue})
    }
    
    init() {
        //tasksArray = mockTasks
        loadFromPersistentStorage()
    }
    
    // MARK: - Persistent Storage Methods
    func loadFromPersistentStorage() {
        let unarchivedTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(kTasks))
        if let tasks = unarchivedTasks as? [Task] {
            tasksArray = tasks
        }
    }
    
    func saveToPersistentStorage() {
        NSKeyedArchiver.archiveRootObject(self.tasksArray, toFile: self.filePath(kTasks))
    }
    
    // MARK: - CRUD Methods
    
    func addTask(task: Task) {
        tasksArray.append(task)
        saveToPersistentStorage()
    }
    
    func removeTask(task: Task) {
        if let index = tasksArray.indexOf(task) {
            tasksArray.removeAtIndex(index)
            saveToPersistentStorage()
        }
    }
    
    var mockTasks: [Task] {
        let mockArray = [Task(name: "Test", notes: "notesTest", dueDate: nil, isComplete: false), Task(name: "Test2", notes: "no notes here, just tests", dueDate: nil, isComplete: false), Task(name: "Test3", notes: nil, dueDate: nil, isComplete: true)]
        return mockArray
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let tasksPath = documentsPath.stringByAppendingString("/\(kTasks).plist")
        return tasksPath
    }
    
    
}