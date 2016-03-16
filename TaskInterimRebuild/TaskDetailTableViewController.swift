//
//  TaskDetailTableViewController.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tapGesture: UITapGestureRecognizer!
    
    var task: Task?
    var dueDateValue: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = datePicker
        self.view.addGestureRecognizer(tapGesture)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithTask(task: Task) {
        self.task = task
        title = task.name
        nameTextField.text = task.name
        
        if let due = task.dueDate {
            dueDateTextField.text = due.stringValue()
        }
        if let notes = task.notes {
            notesTextView.text = notes
        }
    }
    
    func updateWith() {
        let name = nameTextField.text
        let dueDate = dueDateValue
        let notes = notesTextView.text
        
        if let task = self.task {
            task.name = name!
            task.dueDate = dueDate
            task.notes = notes
        } else {
            let newTask = Task(name: name!, notes: notes, dueDate: dueDate)
            TaskController.sharedController.addTask(newTask)
        }
    }
    
    // MARK: - Action Buttons
    
    @IBAction func datePickerValuechanged(sender: UIDatePicker) {
        dueDateTextField.text = sender.date.stringValue()
        dueDateValue = sender.date
    }
    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    @IBAction func savebuttonTapped(sender: UIBarButtonItem) {
        updateWith()
        TaskController.sharedController.saveToPersistentStorage()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

    
}
