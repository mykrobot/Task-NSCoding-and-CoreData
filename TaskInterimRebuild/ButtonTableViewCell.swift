//
//  ButtonTableViewCell.swift
//  TaskInterimRebuild
//
//  Created by Michael Mecham on 3/15/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var button: UIButton!

    var delegate: ButtonTableviewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Action Buttons
    
    @IBAction func buttonTapped(sender: UIButton) {
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateButton(isComplete:Bool) {
        if isComplete {
            button?.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            button?.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}


protocol ButtonTableviewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    func updateWithTask(task: Task) {
        primaryLabel?.text = task.name
        updateButton(task.isComplete!.boolValue)
    }
}