//
//  TaskListTableViewController.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section {
        case 0:
            return TaskController.sharedController.tasksArray.count
        case 1:
            return 1
        default:
            return 1
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("masterTaskListCell", forIndexPath: indexPath) as! ButtonTableViewCell
        let task = TaskController.sharedController.tasksArray[indexPath.row]
//        cell.textLabel?.text = task.name
        cell.updateWithTask(task)
        cell.delegate = self
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let task = TaskController.sharedController.tasksArray[indexPath.row]
            TaskController.sharedController.removeTask(task)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewTaskSegue" {
            let destinationTVC = segue.destinationViewController as? TaskDetailTableViewController
            if let taskDetailTVC = destinationTVC {
                _ = taskDetailTVC.view // forces view to load
                if let selectedRow = tableView.indexPathForSelectedRow?.row {
                    let task = TaskController.sharedController.tasksArray[selectedRow]
                    taskDetailTVC.updateWithTask(task)
                }
//                if let cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) {
//                    let task = TaskController.sharedController.tasksArray[indexPath.row]
//                    taskDetailTVC.updateWithTask(task)
//                }
            }
        }
    }
}

extension TaskListTableViewController: ButtonTableviewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        let indexPath = tableView.indexPathForCell(sender)!
        let task = TaskController.sharedController.tasksArray[indexPath.row]
        task.isComplete = !task.isComplete!.boolValue
        TaskController.sharedController.saveToPersistentStorage()
        tableView.reloadData()
    }
}





































